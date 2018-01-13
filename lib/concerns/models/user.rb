module Wobauth
  module Concerns
    module Models::User
      extend ActiveSupport::Concern

      included do
	has_many :authorities, as: :authorizable, dependent: :destroy
	has_many :roles,       through: :authorities
	has_many :memberships, dependent: :destroy
	has_many :groups, -> { distinct }, through: :memberships
	has_many :group_roles, through: :groups, source: :roles
	has_many :group_authorities, through: :groups, source: :authorities

        validates :username, presence: true, uniqueness: true
      end


      def to_s
        if sn.blank? and givenname.blank?
          "#{username}" 
        elsif title.blank?
          "#{sn}, #{givenname} (#{username})"
        else
          "#{sn}, #{title} #{givenname} (#{username})"
        end
      end
  
      def name
        to_s
      end

      def is_admin?
        role?(:admin)
      end

      def role?(role)
        !!self.roles.find_by_name(role.to_s.camelize)
      end
    end
  end
end
