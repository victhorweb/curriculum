require 'spec_helper'

describe "vacants/edit" do
  before(:each) do
    @vacant = assign(:vacant, stub_model(Vacant,
      :title => "MyString",
      :description => "MyString",
      :sector_id => 1
    ))
  end

  it "renders the edit vacant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vacant_path(@vacant), "post" do
      assert_select "input#vacant_title[name=?]", "vacant[title]"
      assert_select "input#vacant_description[name=?]", "vacant[description]"
      assert_select "input#vacant_sector_id[name=?]", "vacant[sector_id]"
    end
  end
end
