require 'spec_helper'

describe "essays/edit" do
  before(:each) do
    @essay = assign(:essay, stub_model(Essay,
      :question => "MyString",
      :skill => 1,
      :level => 1,
      :reply => "MyString"
    ))
  end

  it "renders the edit essay form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", essay_path(@essay), "post" do
      assert_select "input#essay_question[name=?]", "essay[question]"
      assert_select "input#essay_skill[name=?]", "essay[skill]"
      assert_select "input#essay_level[name=?]", "essay[level]"
      assert_select "input#essay_reply[name=?]", "essay[reply]"
    end
  end
end
