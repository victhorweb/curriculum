require 'spec_helper'

describe "essays/show" do
  before(:each) do
    @essay = assign(:essay, stub_model(Essay,
      :question => "Question",
      :skill => 1,
      :level => 2,
      :reply => "Reply"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Reply/)
  end
end
