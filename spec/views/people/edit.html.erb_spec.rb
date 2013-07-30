require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "MyString",
      :phone => "MyString",
      :mobile_phone => "MyString",
      :university => 1,
      :course => 1,
      :state => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_name[name=?]", "person[name]"
      assert_select "input#person_phone[name=?]", "person[phone]"
      assert_select "input#person_mobile_phone[name=?]", "person[mobile_phone]"
      assert_select "input#person_university[name=?]", "person[university]"
      assert_select "input#person_course[name=?]", "person[course]"
      assert_select "input#person_state[name=?]", "person[state]"
    end
  end
end
