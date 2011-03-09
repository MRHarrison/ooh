class PreregistersController < ApplicationController
before_filter :authenticate_user!
  # GET /preregisters
  # GET /preregisters.xml
  def index
    @preregisters = Preregister.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @preregisters }
    end
  end

  # GET /preregisters/1
  # GET /preregisters/1.xml
  def show
    @preregister = Preregister.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @preregister }
    end
  end

  # GET /preregisters/new
  # GET /preregisters/new.xml
  def new
    @preregister = Preregister.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @preregister }
    end
  end

  # GET /preregisters/1/edit
  def edit
    @preregister = Preregister.find(params[:id])
  end

  # POST /preregisters
  # POST /preregisters.xml
  def create
    @preregister = Preregister.new(params[:preregister])

    respond_to do |format|
      if @preregister.save
        format.html { redirect_to root_path }
        format.xml  { render :xml => @preregister, :status => :created, :location => @preregister }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @preregister.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /preregisters/1
  # PUT /preregisters/1.xml
  def update
    @preregister = Preregister.find(params[:id])

    respond_to do |format|
      if @preregister.update_attributes(params[:preregister])
        format.html { redirect_to(@preregister, :notice => 'Preregister was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @preregister.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /preregisters/1
  # DELETE /preregisters/1.xml
  def destroy
    @preregister = Preregister.find(params[:id])
    @preregister.destroy

    respond_to do |format|
      format.html { redirect_to(preregisters_url) }
      format.xml  { head :ok }
    end
  end
end
