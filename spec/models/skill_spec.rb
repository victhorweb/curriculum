require 'spec_helper'

describe Skill do
  before do
    skill = FactoryGirl.create(:skill)
  end

   it "name shoulbe be valid" do
     FactoryGirl.build(:skill, name: 'ruby').should be_valid
     FactoryGirl.build(:skill, name: "").should_not be_valid
     FactoryGirl.build(:skill, name: nil).should_not be_valid
  end

  it "describe shoulbe be valid" do
     FactoryGirl.build(:skill, description: "ruby language").should be_valid
     FactoryGirl.build(:skill, description: "").should_not be_valid
     FactoryGirl.build(:skill, description: nil).should_not be_valid
  end

  it "Sector shoulbe be valid" do
     FactoryGirl.build(:skill, sector_id: "").should_not be_valid
     FactoryGirl.build(:skill, sector_id: nil).should_not be_valid
  end


end