require 'spec_helper'

describe Essay do
  it " should question is valid" do
    FactoryGirl.build(:essay, question: "som").should be_valid
    FactoryGirl.build(:essay, question: "").should_not be_valid
    FactoryGirl.build(:essay, question: nil).should_not be_valid
  end

  it " should skill is valid" do
    FactoryGirl.build(:essay, skill_id: 1).should be_valid
    FactoryGirl.build(:essay, skill_id: "").should_not be_valid
    FactoryGirl.build(:essay, skill_id: nil).should_not be_valid
  end

 it " should level is valid" do
    FactoryGirl.build(:essay, level_id: 2).should be_valid
    FactoryGirl.build(:essay, level_id: "").should_not be_valid
    FactoryGirl.build(:essay, level_id: nil).should_not be_valid
  end

 it " should reply is valid" do
    FactoryGirl.build(:essay, reply: "som").should be_valid
    FactoryGirl.build(:essay, reply: "").should_not be_valid
    FactoryGirl.build(:essay, reply: nil).should_not be_valid
  end

end