module Wobauth
  # AdminAbility - abilities for wobauth
  # Mostly you have own abilities for your application.
  # If you need access to Wobauth models for non admin users,
  # there are some restrictions: i.e. navigate to Wobauth::User
  # means AdminAbility is active and your abilities from your application
  # are not visible. Or you may overwrite the default abilities for 'Admin',
  # 'OrgaAdmin' or 'UserAdmin'
  # To resolve this, extend Woauth::AdminAbility
  # Example:
  # role 'UserAdmin' should have only read access to all Wobauth models.
  # Add a new method :user_admin to Wobauth::AdminAbility (separate file
  # in your application) and define abilities for 'UserAdmin' there:
  #
  # --- file your_application/app/models/wobauth_ability.rb
  # require 'wobauth/admin_ability'
  # module Wobauth
  #   class AdminAbility
  #     include CanCan::Ability
  #     def user_admin(rights_for)
  #       can :read, [Wobauth::User, Wobauth::Group, ...]
  #       can :whateverelse ....
  #     end
  #   end
  # end
  # ---
  # at least: don't forget to load wobauth_ability.rb

  class AdminAbility
    include CanCan::Ability

    def initialize(user)
      @user = user
      return if @user.nil?
      authorities = (@user.authorities + @user.group_authorities)
      add_abilities(authorities)
    end

  private
    def add_abilities(authorities)
      Array(authorities).each do |authority|
        add_ability(authority)
      end
    end

    def add_ability(authority)
      role = authority.role.name.underscore
      if respond_to?(role)
        send(role, authority.authorized_for)
      else
        fallback(authority)
      end
    end

    def fallback(authority)
     role = authority.role.to_s
     if role == 'Admin'
       can :manage, :all
     elsif role == 'UserAdmin'
       can :manage, :all
     elsif role == 'OrgaAdmin'
       can :read, :all
       can :navigate, Wobauth::User
     end
    end
  end
end
