require 'spec_helper'

describe "foobars/new" do
  before(:each) do
    assign(:foobar, stub_model(Foobar,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new foobar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foobars_path, :method => "post" do
      assert_select "input#foobar_content", :name => "foobar[content]"
    end
  end
end
