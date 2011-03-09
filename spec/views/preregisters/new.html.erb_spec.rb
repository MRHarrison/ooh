require 'spec_helper'

describe "preregisters/new.html.erb" do
  before(:each) do
    assign(:preregister, stub_model(Preregister,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new preregister form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => preregisters_path, :method => "post" do
      assert_select "input#preregister_name", :name => "preregister[name]"
      assert_select "input#preregister_email", :name => "preregister[email]"
    end
  end
end
