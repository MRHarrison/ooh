require "spec_helper"

describe PreregistersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/preregisters" }.should route_to(:controller => "preregisters", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/preregisters/new" }.should route_to(:controller => "preregisters", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/preregisters/1" }.should route_to(:controller => "preregisters", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/preregisters/1/edit" }.should route_to(:controller => "preregisters", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/preregisters" }.should route_to(:controller => "preregisters", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/preregisters/1" }.should route_to(:controller => "preregisters", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/preregisters/1" }.should route_to(:controller => "preregisters", :action => "destroy", :id => "1")
    end

  end
end
