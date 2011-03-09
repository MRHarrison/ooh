require 'spec_helper'

describe "photos/index.html.erb" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :user => "",
        :profile => false
      ),
      stub_model(Photo,
        :user => "",
        :profile => false
      )
    ])
  end

  it "renders a list of photos" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
