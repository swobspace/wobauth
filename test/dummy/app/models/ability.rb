class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    return if @user.nil?
    can :manage, :all
  end

end
