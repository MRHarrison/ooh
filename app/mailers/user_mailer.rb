class UserMailer < ActionMailer::Base
  default :from => "notifications@oohgenesis.com"
 
  def welcome_email(user)
    @user = user
    @url  = "http://oohgenesis.com/login"
    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end
 
end