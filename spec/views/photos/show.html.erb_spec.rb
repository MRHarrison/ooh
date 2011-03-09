require 'spec_helper'

describe "photos/show.html.erb" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :user => "",
      :profile => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
