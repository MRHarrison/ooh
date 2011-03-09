require 'spec_helper'

describe "photos/edit.html.erb" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :new_record? => false,
      :user => "",
      :profile => false
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => photo_path(@photo), :method => "post" do
      assert_select "input#photo_user", :name => "photo[user]"
      assert_select "input#photo_profile", :name => "photo[profile]"
    end
  end
end
