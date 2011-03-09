require 'spec_helper'

describe "photos/new.html.erb" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :user => "",
      :profile => false
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => photos_path, :method => "post" do
      assert_select "input#photo_user", :name => "photo[user]"
      assert_select "input#photo_profile", :name => "photo[profile]"
    end
  end
end
