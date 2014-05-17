module Wobauth
  class AdminAbility
    include CanCan::Ability

    def initialize(user)
      @user = user
      return if @user.nil?
      if @user.roles.map{|r| r.name.camelize}.include?('Admin')
        can :manage, :all
      end
    end
  end
end
