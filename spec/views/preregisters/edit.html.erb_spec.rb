require 'spec_helper'

describe "preregisters/edit.html.erb" do
  before(:each) do
    @preregister = assign(:preregister, stub_model(Preregister,
      :new_record? => false,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit preregister form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => preregister_path(@preregister), :method => "post" do
      assert_select "input#preregister_name", :name => "preregister[name]"
      assert_select "input#preregister_email", :name => "preregister[email]"
    end
  end
end
