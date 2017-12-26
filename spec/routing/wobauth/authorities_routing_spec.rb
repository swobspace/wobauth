require "rails_helper"

module Wobauth
  RSpec.describe AuthoritiesController, type: :routing do
    routes { Wobauth::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/authorities").to route_to(controller: "wobauth/authorities", action: "index")
      end

      it "routes to #new" do
        expect(:get => "/authorities/new").to route_to(controller: "wobauth/authorities", action: "new")
      end

      it "routes to #show" do
        expect(:get => "/authorities/1").to route_to(controller: "wobauth/authorities", action: "show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/authorities/1/edit").to route_to(controller: "wobauth/authorities", action: "edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/authorities").to route_to(controller: "wobauth/authorities", action: "create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/authorities/1").to route_to(controller: "wobauth/authorities", action: "update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/authorities/1").to route_to(controller: "wobauth/authorities", action: "update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/authorities/1").to route_to(controller: "wobauth/authorities", action: "destroy", :id => "1")
      end

    end
  end
end
