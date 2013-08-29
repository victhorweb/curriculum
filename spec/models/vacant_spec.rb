require 'spec_helper'

describe Vacant do
  before do
    vacant = FactoryGirl.create(:vacant)
  end

  it "O titulo deveria ser verdadeiro" do
     FactoryGirl.build(:vacant, title: 'developer').should be_valid
     FactoryGirl.build(:vacant, title: "").should_not be_valid
     FactoryGirl.build(:vacant, title: nil).should_not be_valid
  end
end
