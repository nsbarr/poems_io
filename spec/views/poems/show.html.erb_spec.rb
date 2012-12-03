require 'spec_helper'

describe "poems/show" do
  before(:each) do
    @poem = assign(:poem, stub_model(Poem,
      :content => "Content",
      :user_id => 1,
      :request_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
