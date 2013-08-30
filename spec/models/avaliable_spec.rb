require 'spec_helper'

describe Avaliable do
 it "should name is valid" do
    FactoryGirl.build(:avaliable, level_id: 1).should be_valid
    FactoryGirl.build(:avaliable, level_id: "").should_not be_valid
    FactoryGirl.build(:avaliable, level_id: nil).should_not be_valid
  end

   it "should name is valid" do
    FactoryGirl.build(:avaliable, person_id: 1).should be_valid
    FactoryGirl.build(:avaliable, person_id: "").should_not be_valid
    FactoryGirl.build(:avaliable, person_id: nil).should_not be_valid
  end

 it "should name is valid" do
    FactoryGirl.build(:avaliable, skill_id: 1).should be_valid
    FactoryGirl.build(:avaliable, skill_id: "").should_not be_valid
    FactoryGirl.build(:avaliable, skill_id: nil).should_not be_valid
  end

 it "should name is valid" do
    FactoryGirl.build(:avaliable, vacant_id: 1).should be_valid
    FactoryGirl.build(:avaliable, vacant_id: "").should_not be_valid
    FactoryGirl.build(:avaliable, vacant_id: nil).should_not be_valid
  end

end