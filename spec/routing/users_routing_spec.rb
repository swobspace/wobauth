require "rails_helper"

RSpec.describe Wobauth::UsersController, type: :routing do
  routes { Wobauth::Engine.routes }

  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users").to route_to(controller: "wobauth/users", action: "index")
    end

    it "routes to #new" do
      expect(:get => "/users/new").to route_to(controller: "wobauth/users", action: "new")
    end

    it "routes to #show" do
      expect(:get => "/users/1").to route_to(controller: "wobauth/users", action: "show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/1/edit").to route_to(controller: "wobauth/users", action: "edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users").to route_to(controller: "wobauth/users", action: "create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/1").to route_to(controller: "wobauth/users", action: "update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/1").to route_to(controller: "wobauth/users", action: "update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/1").to route_to(controller: "wobauth/users", action: "destroy", :id => "1")
    end
  end

  describe "routing authorities" do
    it "routes to wobauth/users/authorities#index" do
      expect(:get => "/users/9/authorities").to route_to(controller: 'wobauth/users/authorities', action: "index", user_id: "9")
    end

    it "routes to #new" do
      expect(:get => "/users/9/authorities/new").to route_to(controller: 'wobauth/users/authorities', action: "new", user_id: "9")
    end

    it "routes to #show" do
      expect(:get => "/users/9/authorities/1").to route_to(controller: 'wobauth/users/authorities', action: "show", :id => "1", user_id: "9")
    end

    it "routes to #edit" do
      expect(:get => "/users/9/authorities/1/edit").to route_to(controller: 'wobauth/users/authorities', action: "edit", :id => "1", user_id: "9")
    end

    it "routes to #create" do
      expect(:post => "/users/9/authorities").to route_to(controller: 'wobauth/users/authorities', action: "create", user_id: "9")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/9/authorities/1").to route_to(controller: 'wobauth/users/authorities', action: "update", :id => "1", user_id: "9")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/9/authorities/1").to route_to(controller: 'wobauth/users/authorities', action: "update", :id => "1", user_id: "9")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/9/authorities/1").to route_to(controller: 'wobauth/users/authorities', action: "destroy", :id => "1", user_id: "9")
    end

  end
end
