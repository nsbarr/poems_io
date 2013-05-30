require 'spec_helper'

describe "foobars/edit" do
  before(:each) do
    @foobar = assign(:foobar, stub_model(Foobar,
      :content => "MyString"
    ))
  end

  it "renders the edit foobar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foobars_path(@foobar), :method => "post" do
      assert_select "input#foobar_content", :name => "foobar[content]"
    end
  end
end
