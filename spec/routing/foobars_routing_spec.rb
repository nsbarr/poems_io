require "spec_helper"

describe FoobarsController do
  describe "routing" do

    it "routes to #index" do
      get("/foobars").should route_to("foobars#index")
    end

    it "routes to #new" do
      get("/foobars/new").should route_to("foobars#new")
    end

    it "routes to #show" do
      get("/foobars/1").should route_to("foobars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/foobars/1/edit").should route_to("foobars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/foobars").should route_to("foobars#create")
    end

    it "routes to #update" do
      put("/foobars/1").should route_to("foobars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/foobars/1").should route_to("foobars#destroy", :id => "1")
    end

  end
end
