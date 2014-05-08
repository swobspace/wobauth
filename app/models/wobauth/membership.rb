module Wobauth
  class Membership < ActiveRecord::Base
    # -- associations
    belongs_to :user
    belongs_to :group

    # -- configuration
    # -- validations and callbacks
    validates :user_id, :group_id, presence: true
  end
end
