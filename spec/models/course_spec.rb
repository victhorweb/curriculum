require 'spec_helper'

describe Course do
  it "should name is valid" do
    FactoryGirl.build(:courses, name: 'Engenharia da computacao').should be_valid
    FactoryGirl.build(:courses, name: "").should_not be_valid
    FactoryGirl.build(:courses, name: nil).should_not be_valid
  end

end
