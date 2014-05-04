module Wobauth
  class Role < ActiveRecord::Base
    # -- associations
    has_many :authorities
    has_many :users,  through:     :authorities,
                      source:      :authorizable,
                      source_type: Wobauth.user_class.to_s
    # -- configuration
    # -- validations and callbacks
    validates :name, :presence => true, :uniqueness => true

    def to_s
      name
    end
  end
end
