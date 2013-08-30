require 'spec_helper'

describe User do
  before do
    user = FactoryGirl.create(:user)
  end
    it "email shoulbe be valid" do
     FactoryGirl.build(:user, email: 'develop2er@developer.com').should be_valid
     FactoryGirl.build(:user, email: "").should_not be_valid
     FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "password shoulbe be valid" do
      FactoryGirl.build(:user, password: "").should_not be_valid
      FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it 'should not have dup email' do
    new_user = User.new
    user = FactoryGirl.build(:user)
    new_user.email = user.email
    new_user.should_not be_valid
  end

end