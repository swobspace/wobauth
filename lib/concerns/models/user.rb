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

        validates :username, presence: true, uniqueness: true
        validates :email, presence: true
      end


      def to_s
        if sn.blank? and givenname.blank?
	  "#{email}"
        else
          "#{sn}, #{givenname}"
        end
      end
  
      def name
        to_s
      end

    end
  end
end
