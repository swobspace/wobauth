module Wobauth
  class Authority < ActiveRecord::Base
    belongs_to :authorizable
    belongs_to :role
    belongs_to :authorized_for
  end
end
