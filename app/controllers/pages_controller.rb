class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home, :about]
  
  def home
    @title = "Home"
    @micropost = Micropost.new if user_signed_in?
    @users = User.find(:all, :order => 'random()', :limit => '12')
    @preregister = Preregister.new
    @message = Message.new
    @messages = Message.find(:all)
    if user_signed_in?
      user = current_user
      @user = current_user
      @received_messages = user.received_messages
      @collections = Collection.find(:all)
      @albums = Album.find(:all)
      @photos = Photo.find(:all)
    end
  end

  def contact
    @title = "Contact"
  end
  
  def about
    @title = "About"
  end

  def test
    @title = "test"
  end
  
end
