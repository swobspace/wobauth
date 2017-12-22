require "rails_helper"

RSpec.describe Wobauth::GroupsController, type: :routing do
  routes { Wobauth::Engine.routes }

  describe "routing" do

    it "routes to #index" do
      expect(:get => "/groups").to route_to(controller: "wobauth/groups", action: "index")
    end

    it "routes to #new" do
      expect(:get => "/groups/new").to route_to(controller: "wobauth/groups", action: "new")
    end

    it "routes to #show" do
      expect(:get => "/groups/1").to route_to(controller: "wobauth/groups", action: "show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/groups/1/edit").to route_to(controller: "wobauth/groups", action: "edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/groups").to route_to(controller: "wobauth/groups", action: "create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/groups/1").to route_to(controller: "wobauth/groups", action: "update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/groups/1").to route_to(controller: "wobauth/groups", action: "update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/groups/1").to route_to(controller: "wobauth/groups", action: "destroy", :id => "1")
    end
  end

  describe "routing authorities" do
    it "routes to wobauth/authorities#index" do
      expect(:get => "/groups/9/authorities").to route_to(controller: 'wobauth/authorities', action: "index", group_id: "9")
    end

    it "routes to #new" do
      expect(:get => "/groups/9/authorities/new").to route_to(controller: 'wobauth/authorities', action: "new", group_id: "9")
    end

    it "routes to #show" do
      expect(:get => "/groups/9/authorities/1").to route_to(controller: 'wobauth/authorities', action: "show", :id => "1", group_id: "9")
    end

    it "routes to #edit" do
      expect(:get => "/groups/9/authorities/1/edit").to route_to(controller: 'wobauth/authorities', action: "edit", :id => "1", group_id: "9")
    end

    it "routes to #create" do
      expect(:post => "/groups/9/authorities").to route_to(controller: 'wobauth/authorities', action: "create", group_id: "9")
    end

    it "routes to #update via PUT" do
      expect(:put => "/groups/9/authorities/1").to route_to(controller: 'wobauth/authorities', action: "update", :id => "1", group_id: "9")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/groups/9/authorities/1").to route_to(controller: 'wobauth/authorities', action: "update", :id => "1", group_id: "9")
    end

    it "routes to #destroy" do
      expect(:delete => "/groups/9/authorities/1").to route_to(controller: 'wobauth/authorities', action: "destroy", :id => "1", group_id: "9")
    end

  end
end
