require 'rails_helper'

RSpec.describe Wobauth::AuthoritiesController, type: :controller do
  routes { Wobauth::Engine.routes }

  fixtures :users, :roles
  set_fixture_class users: Wobauth::User, roles: Wobauth::Role

end
