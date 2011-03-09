class UsersController < ApplicationController
  before_filter :get_user, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create, :users]
  load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]

  def index
    @users = User.paginate :page => params[:page], :per_page => 50, :order => "first_name, last_name"
    @title = "All users"
  end
  
  def new
    @user = User.new()
    5.times { @user.assets.build }  
  end

  def show
    @users = User.accessible_by(current_ability, :index).limit(20)
    @user = User.find(params[:id])
    @title = current_user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      if params[:user][:avatar].blank?
          flash[:notice] = "Welcome to OOHLive"
          redirect_to root_path
        else
          render :action => "crop"
      end
    else
      render :action => 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        if params[:user][:avatar].blank?
          flash[:notice] = "Successfully updated your profile"
          redirect_to root_path
        else
          render :action => "crop"
        end
    else
      render :action => 'edit'
    end
    rescue ActiveRecord::RecordNotFound
       respond_to_not_found(:js, :xml, :html)
     respond_to do |format|
       format.html
       format.js 
     end
    
  end

  def edit
    @user = User.find(params[:id])
    5.times { @user.assets.build }
  end  

  def destroy
    @user.destroy!
  end
  
  # Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

end
