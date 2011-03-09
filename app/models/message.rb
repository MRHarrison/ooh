class Message < ActiveRecord::Base
  
  belongs_to :sender, :class_name => 'User', :foreign_key =>'sender_id'
  belongs_to :recipient, :class_name => 'User', :foreign_key =>'recipient_id'
  
  def sent_messages
  end
  
  def recipient_messages
  end
  
end