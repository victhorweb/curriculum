require 'spec_helper'

describe "vacants/show" do
  before(:each) do
    @vacant = assign(:vacant, stub_model(Vacant,
      :title => "Title",
      :description => "Description",
      :sector_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/1/)
  end
end
