module Wobauth
  class Authority < ActiveRecord::Base
    # -- associations
    belongs_to :authorizable,   polymorphic: true
    belongs_to :role
    belongs_to :authorized_for, polymorphic: true

    # -- configuration
    # -- validations and callbacks
    validates :authorizable_id, :authorizable_type,
              :role_id, presence: true

    scope :valid, ->(date) { 
      where('(valid_until >= ? OR valid_until is NULL) AND (valid_from <= ? OR valid_from is NULL)', date, date)
    }
  end
end
