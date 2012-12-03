require 'spec_helper'

describe "poems/edit" do
  before(:each) do
    @poem = assign(:poem, stub_model(Poem,
      :content => "MyString",
      :user_id => 1,
      :request_id => 1
    ))
  end

  it "renders the edit poem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => poems_path(@poem), :method => "post" do
      assert_select "input#poem_content", :name => "poem[content]"
      assert_select "input#poem_user_id", :name => "poem[user_id]"
      assert_select "input#poem_request_id", :name => "poem[request_id]"
    end
  end
end
