require 'spec_helper'

describe "poems/index" do
  before(:each) do
    assign(:poems, [
      stub_model(Poem,
        :content => "Content",
        :user_id => 1,
        :request_id => 2
      ),
      stub_model(Poem,
        :content => "Content",
        :user_id => 1,
        :request_id => 2
      )
    ])
  end

  it "renders a list of poems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
