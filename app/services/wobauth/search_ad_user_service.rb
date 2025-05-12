require 'immutable-struct'
module Wobauth
  class SearchAdUserService
    Result = ::ImmutableStruct.new( :success?, :error_messages, :ad_users )

    def initialize(options = {})
      @options = options.symbolize_keys
      @ldap_options = options.fetch(:ldap_options, Wobauth.ldap_options)
      @query        = options.fetch(:query, false)
    end

    def call
      if @ldap_options.blank?
	return Result.new(success: false, error_messages: ["ldap not configured"], ad_users: [])
      end
      unless query
	return Result.new(success: false, error_messages: ["no query given"], ad_users: [])
      end

      errors = []
      ad_users = []
      ldap_options.each do |ldapopts|
        ldap = Wobaduser::LDAP.new(ldap_options: ldapopts)
        if ldap.errors.any?
          errors += ldap.errors
          next
        end
        search = Wobaduser::User.search(ldap: ldap, filter: user_filter(query))
        if search.success?
          ad_users += search.entries
        else
          errors += search.errors
        end
      end

      if errors.any?
        return Result.new(success: false, error_messages: errors, ad_users: ad_users)
      else
        result = Result.new(success: true, error_messages: errors, ad_users: ad_users)
      end
    end

  private
    attr_reader :query, :ldap_options

    # use filter in Wobaduser::User.search
    # objectclass=user will be implicit added via Wobaduser::User.filter
    def user_filter(query)
      filter = Net::LDAP::Filter.eq('objectClass', 'user')

      if query =~ /all\:/
        Rails.logger.debug("DEBUG:: query with all:")
        q = query.gsub(/all:/, '')
      else
        filter = filter & ~(Net::LDAP::Filter.ex('UserAccountControl:1.2.840.113556.1.4.803', 2))
        q = query
      end

      if q =~ /\Agroup:(.*)\z/
        filter = filter & Net::LDAP::Filter.eq('memberOf', "#{$1}")
      else
        filter = filter & default_filter(q)
      end
      filter
    end

    def default_filter(query)
      filter = "(|(sn=#{query}*)(givenName=#{query}*)(mail=#{query}*)(samaccountname=#{query})(userprincipalname=#{query}*)(extensionAttribute15=#{query}*))"
      filter = Net::LDAP::Filter.construct(filter)
    end

    def ldap_options
      if @ldap_options.kind_of? Hash
        [@ldap_options]
      else
        @ldap_options
      end
    end
  end
end
