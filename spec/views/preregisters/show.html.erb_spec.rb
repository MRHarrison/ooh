require 'spec_helper'

describe "preregisters/show.html.erb" do
  before(:each) do
    @preregister = assign(:preregister, stub_model(Preregister,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
