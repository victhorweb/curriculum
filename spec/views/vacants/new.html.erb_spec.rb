require 'spec_helper'

describe "vacants/new" do
  before(:each) do
    assign(:vacant, stub_model(Vacant,
      :title => "MyString",
      :description => "MyString",
      :sector_id => 1
    ).as_new_record)
  end

  it "renders new vacant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vacants_path, "post" do
      assert_select "input#vacant_title[name=?]", "vacant[title]"
      assert_select "input#vacant_description[name=?]", "vacant[description]"
      assert_select "input#vacant_sector_id[name=?]", "vacant[sector_id]"
    end
  end
end
