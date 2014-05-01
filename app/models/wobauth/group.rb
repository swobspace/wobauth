module Wobauth
  class Group < ActiveRecord::Base
    # -- validations and callbacks
    validates :name, :presence => true, :uniqueness => true
  end
end
