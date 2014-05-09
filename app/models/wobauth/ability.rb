module Wobauth
  class Ability
    include CanCan::Ability

    def initialize(user)
      @user = user
      can :manage, :all
    end

  end
end
