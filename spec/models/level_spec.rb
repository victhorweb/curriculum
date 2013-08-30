require 'spec_helper'

describe Level do

it " should name is valid" do
    FactoryGirl.build(:level, name: "som").should be_valid
    FactoryGirl.build(:level, name: "").should_not be_valid
    FactoryGirl.build(:level, name: nil).should_not be_valid
  end

it " should score is valid" do
    FactoryGirl.build(:level, score: 1).should be_valid
    FactoryGirl.build(:level, score: "").should_not be_valid
    FactoryGirl.build(:level, score: nil).should_not be_valid
  end

end