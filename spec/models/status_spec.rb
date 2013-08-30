require 'spec_helper'

describe Status do
  before do
    vacant = FactoryGirl.create(:status)
  end
    it "name shoulbe be valid" do
     FactoryGirl.build(:status, name: 'teste').should be_valid
     FactoryGirl.build(:status, name: "").should_not be_valid
     FactoryGirl.build(:status, name: nil).should_not be_valid
  end

end