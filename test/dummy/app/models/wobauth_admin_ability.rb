require 'wobauth/admin_ability'

module Wobauth
  class AdminAbility
    include CanCan::Ability

    def eins(authorized_for)
      can :read, :all
      can :navigate, :all
    end
  end
end
