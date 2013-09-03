require 'spec_helper'

describe VacantsController do

  describe "GET index" do
    it "assigns all vacants as @vacants" do
      vacant = FactoryGirl.create(:vacant)
      get :index
      assigns(:vacants).should eq([vacant])
    end
  end

  describe "GET show" do
    it "assigns the requested vacant as @vacant" do
      vacant = FactoryGirl.create(:vacant)
      get :show, {:id => vacant.to_param}, {id: vacant.id}
      assigns(:vacant).should eq(vacant)
    end
  end


end
