require 'spec_helper'

describe Vacant do
  before do
    vacant = FactoryGirl.create(:vacant)
  end

  it "title shoulbe be valid" do
     FactoryGirl.build(:vacant, title: 'developer').should be_valid
     FactoryGirl.build(:vacant, title: "").should_not be_valid
     FactoryGirl.build(:vacant, title: nil).should_not be_valid
  end

  it "Date should be valid"do
    FactoryGirl.build(:vacant, date_end: Date.today).should be_valid
  end

  it "Date should be valid"do
    FactoryGirl.build(:vacant, date_end: Date.today - 1.day).should_not be_valid
  end

end