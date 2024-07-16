require 'net/ldap'
require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable
      def authenticate!
        return fail('LDAP disabled') unless Wobauth.enable_ldap_authenticatable

        if params['user']
          return fail('Local user') unless params['user']['username']&.match(/@/)

          user = Wobauth::User.where(username: params['user']['username']).first
          unless user.present?
            return fail!(:invalid_login)
          end

          Wobauth.ldap_options.each do |ldap_opts|
            ldap_opts[:auth].merge!(username: params['user']['username'], 
                                   password: params['user']['password'])
            ldap = Wobaduser::LDAP.new(ldap_options: ldap_opts, bind: true)
        
            if ldap.errors.empty?
              return success!(user)
            end
          end
          return fail(:invalid_login)
        end
      end
      
      def email
        params['user']['email']
      end

      def password
        params['user']['password']
      end

    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)
