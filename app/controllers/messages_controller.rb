class MessagesController < ApplicationController
  before_filter :authenticate_user!
                            
  def index
    user = current_user
    @sent_messages = user.sent_messages
    @received_messages = user.received_messages
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
      format.json { render :json => @messages } 
    end
  end


  def show
    @message = Message.find(params[:id])
    if current_user == @message.recipient
      @message.update_attributes(:read=>true)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
      format.json { render :json => @message } 
    end
  end


  def new
    @message = Message.new
    @recipient_id = params[:recipient_id]
    @subject = params[:subject]
    if @recipient_id == nil
      @users = User.find(:all)
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
      format.json { render :json => @message } 
    end
  end


  def create
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id
    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message was successfully created.'
        # TODO send email notification to recipient
        
        format.html { redirect_to root_path }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
        format.json { render :json => @message, :status => :created, :location => @message } 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        format.json { render :json => @message.errors, :status => :unprocessable_entity } 
      end
    end
  end


  def update
    @message = Message.find(params[:id])
    respond_to do |format|
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        format.html { redirect_to root_path }
        format.xml  { head :ok }
        format.json { head :ok } 
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
        format.json { render :json => @message.errors, :status => :unprocessable_entity } 
      end
    end
  end


  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.xml  { head :ok }
      format.json { head :ok } 
    end
  end
end
