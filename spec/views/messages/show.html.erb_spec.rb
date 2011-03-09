require 'spec_helper'

describe "messages/show.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :subject => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
