module Wobauth
  class Group < ActiveRecord::Base
    # -- associations
    has_many :authorities, as: :authorizable, dependent: :destroy
    has_many :roles,       through: :authorities
    has_many :memberships, dependent: :destroy
    has_many :users, -> { uniq }, through: :memberships,
                     source: :user
    # -- configuration
    # -- validations and callbacks
    validates :name, presence: true, uniqueness: {case_sensitive: true}

    def to_s
      name
    end
  end
end
