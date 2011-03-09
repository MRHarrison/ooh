require 'spec_helper'

describe PreregistersController do

  def mock_preregister(stubs={})
    (@mock_preregister ||= mock_model(Preregister).as_null_object).tap do |preregister|
      preregister.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all preregisters as @preregisters" do
      Preregister.stub(:all) { [mock_preregister] }
      get :index
      assigns(:preregisters).should eq([mock_preregister])
    end
  end

  describe "GET show" do
    it "assigns the requested preregister as @preregister" do
      Preregister.stub(:find).with("37") { mock_preregister }
      get :show, :id => "37"
      assigns(:preregister).should be(mock_preregister)
    end
  end

  describe "GET new" do
    it "assigns a new preregister as @preregister" do
      Preregister.stub(:new) { mock_preregister }
      get :new
      assigns(:preregister).should be(mock_preregister)
    end
  end

  describe "GET edit" do
    it "assigns the requested preregister as @preregister" do
      Preregister.stub(:find).with("37") { mock_preregister }
      get :edit, :id => "37"
      assigns(:preregister).should be(mock_preregister)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created preregister as @preregister" do
        Preregister.stub(:new).with({'these' => 'params'}) { mock_preregister(:save => true) }
        post :create, :preregister => {'these' => 'params'}
        assigns(:preregister).should be(mock_preregister)
      end

      it "redirects to the created preregister" do
        Preregister.stub(:new) { mock_preregister(:save => true) }
        post :create, :preregister => {}
        response.should redirect_to(preregister_url(mock_preregister))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved preregister as @preregister" do
        Preregister.stub(:new).with({'these' => 'params'}) { mock_preregister(:save => false) }
        post :create, :preregister => {'these' => 'params'}
        assigns(:preregister).should be(mock_preregister)
      end

      it "re-renders the 'new' template" do
        Preregister.stub(:new) { mock_preregister(:save => false) }
        post :create, :preregister => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested preregister" do
        Preregister.should_receive(:find).with("37") { mock_preregister }
        mock_preregister.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :preregister => {'these' => 'params'}
      end

      it "assigns the requested preregister as @preregister" do
        Preregister.stub(:find) { mock_preregister(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:preregister).should be(mock_preregister)
      end

      it "redirects to the preregister" do
        Preregister.stub(:find) { mock_preregister(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(preregister_url(mock_preregister))
      end
    end

    describe "with invalid params" do
      it "assigns the preregister as @preregister" do
        Preregister.stub(:find) { mock_preregister(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:preregister).should be(mock_preregister)
      end

      it "re-renders the 'edit' template" do
        Preregister.stub(:find) { mock_preregister(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested preregister" do
      Preregister.should_receive(:find).with("37") { mock_preregister }
      mock_preregister.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the preregisters list" do
      Preregister.stub(:find) { mock_preregister }
      delete :destroy, :id => "1"
      response.should redirect_to(preregisters_url)
    end
  end

end
