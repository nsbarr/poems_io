require 'spec_helper'

describe "foobars/index" do
  before(:each) do
    assign(:foobars, [
      stub_model(Foobar,
        :content => "Content"
      ),
      stub_model(Foobar,
        :content => "Content"
      )
    ])
  end

  it "renders a list of foobars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
