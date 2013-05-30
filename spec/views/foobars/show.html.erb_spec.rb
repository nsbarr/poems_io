require 'spec_helper'

describe "foobars/show" do
  before(:each) do
    @foobar = assign(:foobar, stub_model(Foobar,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
