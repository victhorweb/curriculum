require 'spec_helper'

describe Correction do
  it "should name is valid" do
    FactoryGirl.build(:correction, validing: 'Engenharia da computacao').should be_valid
    FactoryGirl.build(:correction, validing: "").should_not be_valid
    FactoryGirl.build(:correction, validing: nil).should_not be_valid
  end

  it "should name is valid" do
    FactoryGirl.build(:correction, number: 'Engenharia da computacao').should be_valid
    FactoryGirl.build(:correction, number: "").should_not be_valid
    FactoryGirl.build(:correction, number: nil).should_not be_valid
  end

  it "should name is valid" do
    FactoryGirl.build(:correction, person_question_id: 'Engenharia da computacao').should be_valid
    FactoryGirl.build(:correction, person_question_id: "").should_not be_valid
    FactoryGirl.build(:correction, person_question_id: nil).should_not be_valid
  end
end