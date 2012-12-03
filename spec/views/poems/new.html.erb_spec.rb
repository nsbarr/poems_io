require 'spec_helper'

describe "poems/new" do
  before(:each) do
    assign(:poem, stub_model(Poem,
      :content => "MyString",
      :user_id => 1,
      :request_id => 1
    ).as_new_record)
  end

  it "renders new poem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => poems_path, :method => "post" do
      assert_select "input#poem_content", :name => "poem[content]"
      assert_select "input#poem_user_id", :name => "poem[user_id]"
      assert_select "input#poem_request_id", :name => "poem[request_id]"
    end
  end
end
