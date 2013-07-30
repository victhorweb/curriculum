require 'spec_helper'

describe Sector do
	it "should name is valid" do
    FactoryGirl.build(:sectors, name: 'developer').should be_valid
    FactoryGirl.build(:sectors, name: "").should_not be_valid
    FactoryGirl.build(:sectors, name: nil).should_not be_valid
  end
end
