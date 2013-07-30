require 'spec_helper'

describe "essays/index" do
  before(:each) do
    assign(:essays, [
      stub_model(Essay,
        :question => "Question",
        :skill => 1,
        :level => 2,
        :reply => "Reply"
      ),
      stub_model(Essay,
        :question => "Question",
        :skill => 1,
        :level => 2,
        :reply => "Reply"
      )
    ])
  end

  it "renders a list of essays" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Reply".to_s, :count => 2
  end
end
