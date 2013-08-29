require 'spec_helper'

describe Person do
  before do
    person = FactoryGirl.create(:person)
  end

it "should name is valid" do
   FactoryGirl.build(:person, name: 'developer').should be_valid
   FactoryGirl.build(:person, name: "").should_not be_valid
   FactoryGirl.build(:person, name: nil).should_not be_valid
  end

  it "should phone is valid" do
   FactoryGirl.build(:person, phone: '(18)3631-2810').should be_valid
  end

  it "should phone is not valid" do
    FactoryGirl.build(:person, phone: "").should_not be_valid
  end

  it "should phone is not valid format" do
   FactoryGirl.build(:person, phone: "36312810").should_not be_valid
  end

  it"should phone is not null"do
     FactoryGirl.build(:person, phone: nil).should_not be_valid
  end

  it "should mobile phone is valid" do
     FactoryGirl.build(:person, phone: '(18)3631-2810').should be_valid
  end

  it "should mobile phone is not valid" do
    FactoryGirl.build(:person, phone: "").should_not be_valid
  end

  it "should mobile phone is not valid format" do
     FactoryGirl.build(:person, phone: "36312810").should_not be_valid
  end

  it"should mobile phone is not null"do
     FactoryGirl.build(:person, phone: nil).should_not be_valid
  end

  it "should semester is valid" do
    FactoryGirl.build(:person, semester: 6).should be_valid
  end

  it "should semester is not blank" do
    FactoryGirl.build(:person, semester: "").should_not be_valid
  end

  it "should semester is not null" do
    FactoryGirl.build(:person, semester: nil).should_not be_valid
  end

  it "should video conferencia is valid" do
     FactoryGirl.build(:person, video_conf: 'lol@lol.com').should be_valid
    end

  it "should video conferencia is valid" do
     FactoryGirl.build(:person, video_conf: 'lol@lol.com').should be_valid
    end

  it "should video conferencia is not have blank" do
     FactoryGirl.build(:person, video_conf: '').should_not be_valid
  end

  it "should video conferencia is not have null" do
     FactoryGirl.build(:person, video_conf: nil).should_not be_valid
  end

  it "should curriculum is not blank" do
    FactoryGirl.build(:person, curriculum: "").should_not be_valid
  end

  it "should curriculum is not null" do
    FactoryGirl.build(:person, curriculum: nil).should_not be_valid
  end

  it "should curriculum is not null" do
    FactoryGirl.build(:person, curriculum: nil).should_not be_valid
  end

  it "should email is valid" do
    FactoryGirl.build(:person, email: "lol@lol.com").should be_valid
  end

  it "should email is valid" do
    FactoryGirl.build(:person, email: "lol@lol.com.br").should be_valid
  end


  it "should email is note blank" do
    FactoryGirl.build(:person, email: "").should_not be_valid
  end

  it "should email is note blank" do
    FactoryGirl.build(:person, email: nil).should_not be_valid
  end
end