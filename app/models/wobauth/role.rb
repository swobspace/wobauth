module Wobauth
  class Role < ActiveRecord::Base
    # -- validations and callbacks
    validates :name, :presence => true, :uniqueness => true
  end
end
