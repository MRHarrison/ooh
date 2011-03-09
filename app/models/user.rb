class User < ActiveRecord::Base
  has_many :user_tokens
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :encryptable, :encryptor => :sha1
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :user_id, :email, :password, :password_confirmation, :name, :first_name, :last_name, :role, :role_ids, :roles_users
  attr_accessible :photo, :avatar, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :bio, :sex, :birthday, :facebook, :twitter, :hometown, :current_city, :interested_in, :looking_for
  attr_accessible :sent_messages, :received_messages
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?
  
  has_and_belongs_to_many :roles
    
  has_many :relationships, :dependent => :destroy,
                           :foreign_key => "follower_id"
  has_many :reverse_relationships, :dependent => :destroy,
                                   :foreign_key => "followed_id",
                                   :class_name => "Relationship"
  has_many :following, :through => :relationships, :source => :followed
  has_many :followers, :through => :reverse_relationships,
                       :source  => :follower
  
   has_many :sent_messages, :class_name => 'Message', :foreign_key =>'sender_id', :order=>'created_at DESC'
   has_many :received_messages, :class_name => 'Message', :foreign_key =>'recipient_id', :order=>'created_at DESC'
   has_many :unread_messages, :class_name => 'Message', :foreign_key =>'recipient_id', :conditions => {:read => false} 

   has_many :assets
   accepts_nested_attributes_for :assets, :allow_destroy => true
  
  validates :first_name,  :presence => true,  
                    :length   => { :maximum => 25 }

  validates :last_name,  :presence => true,  
                    :length   => { :maximum => 25 }
                    
  has_attached_file :avatar, :styles => { :thumb  => "50x50#",
                                          :small  => "100x100#",
                                          :medium => "175x175#",
                                          :large  => "400x400>"   },
                    :processors => [:cropper],
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :url  => "/assets/users/:id/:basename/:style.:extension",
                    :path => ":rails_root/public/assets/users/:id/:basename/:style.:extension"
                    :bucket => 'oohlive'

  
  scope :order_by, lambda { |o| {:order => o} }

  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']

  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session[:omniauth]
          user.user_tokens.build(:provider => data['provider'], :uid => data['uid'])
        end
      end
  end

    def apply_omniauth(omniauth)
      #add some info about the user
      #self.name = omniauth['user_info']['name'] if name.blank?
      #self.nickname = omniauth['user_info']['nickname'] if nickname.blank?

      unless omniauth['credentials'].blank?
        user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
        #user_tokens.build(:provider => omniauth['provider'], 
        #                  :uid => omniauth['uid'],
        #                  :token => omniauth['credentials']['token'], 
        #                  :secret => omniauth['credentials']['secret'])
      else
        user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      end
      #self.confirm!# unless user.email.blank?
    end

    def password_required?
      (user_tokens.empty? || !password.blank?) && super 
    end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def feed
    Micropost.from_users_followed_by(self)
  end
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end


  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end

  def name
    if first_name && last_name
      first_name + ' ' + last_name
    elsif first_name
      first_name
    elsif last_name
      last_name
    else
      login
    end
  end

  private

  def reprocess_avatar
    avatar.reprocess!
  end
end
