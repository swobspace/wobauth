require "rails_helper"

RSpec.describe Wobauth::AdUsersController, type: :routing do
  routes { Wobauth::Engine.routes }

  describe "routing" do

    it "routes to #index" do
      pending "routing doesn't work yet"
      expect(get: ad_users_path).to route_to(controller: "wobauth/ad_users", action: "index")
    end

  end
end
