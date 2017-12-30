module Wobauth
  class AdminAbility
    include CanCan::Ability

    def initialize(user)
      @user = user
      return if @user.nil?
      roles = (@user.roles + @user.group_roles).map{|r| r.name.camelize}
      if roles.include?('Admin')
        can :manage, :all
      elsif roles.include?('UserAdmin')
        can :manage, :all
      elsif roles.include?('OrgaAdmin')
        can :read, :all
        can :navigate, Wobauth::User
      end
    end
  end
end
