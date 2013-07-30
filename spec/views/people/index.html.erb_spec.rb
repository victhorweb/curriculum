require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name",
        :phone => "Phone",
        :mobile_phone => "Mobile Phone",
        :university => 1,
        :course => 2,
        :state => "State"
      ),
      stub_model(Person,
        :name => "Name",
        :phone => "Phone",
        :mobile_phone => "Mobile Phone",
        :university => 1,
        :course => 2,
        :state => "State"
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
