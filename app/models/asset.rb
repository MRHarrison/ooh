class Asset < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :photo, :styles => { :thumb  => "50x50#",
                                           :small  => "100x100#",
                                           :medium => "175x175#",
                                           :large  => "400x400>"   },
                     :processors => [:cropper],
                     :url  => "/assets/photo/:id/:basename/:style.:extension",
                     :path => ":rails_root/public/assets/photo/:id/:basename/:style.:extension"

   validates_attachment_presence :photo
   validates_attachment_size :photo, :less_than => 5.megabytes
   validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']

end
