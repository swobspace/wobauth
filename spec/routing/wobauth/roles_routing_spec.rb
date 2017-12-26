require "rails_helper"

module Wobauth
  RSpec.describe RolesController, type: :routing do
    routes { Wobauth::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/roles").to route_to(controller: "wobauth/roles", action: "index")
      end

      it "routes to #show" do
        expect(:get => "/roles/1").to route_to(controller: "wobauth/roles", action: "show", :id => "1")
      end

    end
  end
end
