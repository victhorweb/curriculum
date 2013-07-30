require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "Name",
      :phone => "Phone",
      :mobile_phone => "Mobile Phone",
      :university => 1,
      :course => 2,
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Phone/)
    rendered.should match(/Mobile Phone/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/State/)
  end
end
