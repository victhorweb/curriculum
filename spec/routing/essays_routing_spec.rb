require "spec_helper"

describe EssaysController do
  describe "routing" do

    it "routes to #index" do
      get("/essays").should route_to("essays#index")
    end

    it "routes to #new" do
      get("/essays/new").should route_to("essays#new")
    end

    it "routes to #show" do
      get("/essays/1").should route_to("essays#show", :id => "1")
    end

    it "routes to #edit" do
      get("/essays/1/edit").should route_to("essays#edit", :id => "1")
    end

    it "routes to #create" do
      post("/essays").should route_to("essays#create")
    end

    it "routes to #update" do
      put("/essays/1").should route_to("essays#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/essays/1").should route_to("essays#destroy", :id => "1")
    end

  end
end
