module Wobauth
  class Role < ActiveRecord::Base
    # -- associations
    has_many :authorities
    has_many :users,  through:     :authorities,
                      source:      :authorizable,
                      source_type: Wobauth::User
    has_many :groups, through:     :authorities,
                      source:      :authorizable,
                      source_type: Wobauth::Group
    # -- configuration
    # -- validations and callbacks
    validates :name, presence: true, uniqueness: {case_sensitive: true}

    def to_s
      name
    end
  end
end
