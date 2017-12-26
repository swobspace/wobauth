require "rails_helper"

module Wobauth
  RSpec.describe MembershipsController, type: :routing do
    routes { Wobauth::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/memberships").to route_to(controller: "wobauth/memberships", action: "index")
      end

      it "routes to #new" do
        expect(:get => "/memberships/new").to route_to(controller: "wobauth/memberships", action: "new")
      end

      it "routes to #show" do
        expect(:get => "/memberships/1").to route_to(controller: "wobauth/memberships", action: "show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/memberships/1/edit").to route_to(controller: "wobauth/memberships", action: "edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/memberships").to route_to(controller: "wobauth/memberships", action: "create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/memberships/1").to route_to(controller: "wobauth/memberships", action: "update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/memberships/1").to route_to(controller: "wobauth/memberships", action: "update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/memberships/1").to route_to(controller: "wobauth/memberships", action: "destroy", :id => "1")
      end

    end
  end
end
