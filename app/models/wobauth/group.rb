module Wobauth
  class Group < ActiveRecord::Base
    # -- associations
    has_many :authorities, as: :authorizable
    has_many :roles,       through: :authorities
    has_many :memberships
    has_many :users, -> { uniq }, through: :memberships,
                     source: :user
    # -- configuration
    # -- validations and callbacks
    validates :name, :presence => true, :uniqueness => true

    def self.data_url
      Wobauth::Engine.routes.url_helpers.groups_path(format: :json)
    end

    def to_s
      name
    end
  end
end
