require 'spec_helper'

describe Inscrition do

it " should name is valid" do
    FactoryGirl.build(:inscrition, person_id: 1).should be_valid
    FactoryGirl.build(:inscrition, person_id: "").should_not be_valid
    FactoryGirl.build(:inscrition, person_id: nil).should_not be_valid
  end

it " should score is valid" do
    FactoryGirl.build(:inscrition, vacant_id: 1).should be_valid
    FactoryGirl.build(:inscrition, vacant_id: "").should_not be_valid
    FactoryGirl.build(:inscrition, vacant_id: nil).should_not be_valid
  end

it " should score is valid" do
    FactoryGirl.build(:inscrition, status_id: 1).should be_valid
    FactoryGirl.build(:inscrition, status_id: "").should_not be_valid
    FactoryGirl.build(:inscrition, status_id: nil).should_not be_valid
  end

end
