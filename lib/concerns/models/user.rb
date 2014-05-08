module Wobauth
  module Concerns
    module Models::User
      extend ActiveSupport::Concern

      included do
	has_many :authorities, as: :authorizable, dependent: :destroy
	has_many :roles,       through: :authorities
	has_many :memberships, dependent: :destroy
	has_many :group_roles, through: :groups, source: :roles
	has_many :groups, -> { uniq }, through: :memberships
      end

      def to_s
	email
      end

    end
  end
end
