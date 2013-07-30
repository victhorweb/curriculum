require "spec_helper"

describe VacantsController do
  describe "routing" do

    it "routes to #index" do
      get("/vacants").should route_to("vacants#index")
    end

    it "routes to #new" do
      get("/vacants/new").should route_to("vacants#new")
    end

    it "routes to #show" do
      get("/vacants/1").should route_to("vacants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vacants/1/edit").should route_to("vacants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vacants").should route_to("vacants#create")
    end

    it "routes to #update" do
      put("/vacants/1").should route_to("vacants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vacants/1").should route_to("vacants#destroy", :id => "1")
    end

  end
end
