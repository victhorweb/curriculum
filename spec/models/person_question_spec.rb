require 'spec_helper'

describe PersonQuestion do

  it "replay name is valid" do
    FactoryGirl.build(:person_question, replay: 'exemplo').should be_valid
    FactoryGirl.build(:person_question, replay: "").should_not be_valid
    FactoryGirl.build(:person_question, replay: nil).should_not be_valid
  end

  it "essay should name is valid" do
    FactoryGirl.build(:person_question, essay_id: 1).should be_valid
    FactoryGirl.build(:person_question, essay_id: "").should_not be_valid
    FactoryGirl.build(:person_question, essay_id: nil).should_not be_valid
  end

  it "person should name is valid" do
    FactoryGirl.build(:person_question, person_id: 1).should be_valid
    FactoryGirl.build(:person_question, person_id: "").should_not be_valid
    FactoryGirl.build(:person_question, person_id: nil).should_not be_valid
  end

  it "Vacant should name is valid" do
    FactoryGirl.build(:person_question, vacant_id: 1).should be_valid
    FactoryGirl.build(:person_question, vacant_id: "").should_not be_valid
    FactoryGirl.build(:person_question, vacant_id: nil).should_not be_valid
  end

end
