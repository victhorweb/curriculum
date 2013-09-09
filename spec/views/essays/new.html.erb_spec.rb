require 'spec_helper'

describe "essays/new" do
  before(:each) do
    assign(:essay, stub_model(Essay,
      :question => "MyString",
      :skill_id => 1,
      :level_id => 1,
      :reply => "MyString"
    ).as_new_record)
  end

  it "renders new essay form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", essays_path, "post" do
      assert_select "input#essay_question[name=?]", "essay[question]"
      assert_select "input#essay_skill[name=?]", "essay[skill]"
      assert_select "input#essay_level[name=?]", "essay[level]"
      assert_select "input#essay_reply[name=?]", "essay[reply]"
    end
  end
end
