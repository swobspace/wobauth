require 'immutable-struct'
module Wobauth
  class SearchAdUserService
    Result = ::ImmutableStruct.new( :success?, :error_messages, :ad_users )

    def initialize(options = {})
      @options = options.symbolize_keys
      @ldap_options = options.fetch(:ldap_options, Wobauth.ldap_options)
      if @ldap_options.blank?
        raise RuntimeError, "ldap_options not set!"
      end
      @query        = options.fetch(:query, false)
    end

    def call
      unless query
	return Result.new(success: false, error_messages: ["no query given"], ad_users: [])
      end

      ldap = Wobaduser::LDAP.new(ldap_options: ldap_options)
      if ldap.errors.any?
	return Result.new(success: false, error_messages: ldap.errors, ad_users: [])
      end

      search = Wobaduser::User.search(ldap: ldap, filter: user_filter(query))
      if search.success?
	result = Result.new(success: true, error_messages: [], ad_users: search.entries)
      else
	result = Result.new(success: false, error_messages: search.errors, ad_users: [])
       end
    end

  private
    attr_reader :query, :ldap_options

    # use filter in Wobaduser::User.search
    # objectclass=user will be implicit added via Wobaduser::User.filter
    def user_filter(query)
      filter  = "(&"
      filter += "(|(sn=#{query}*)(givenName=#{query}*)(mail=#{query}*))"
      filter += "(!(sAMAccountname=admin*))"
      filter += "(!(sAMAccountname=*test*))"
      filter += "(!(sn=*test*))"
      filter += "(!(sn=*admin*))"
      filter += "(!(givenName=*admin*))"
      filter += "(UserAccountControl:1.2.840.113556.1.4.803:=512)"
      filter += "(!(UserAccountControl:1.2.840.113556.1.4.803:=2))"
      filter += "(!(primaryGroupID=512))"
      filter += "(!(msExchHideFromAddressLists=TRUE))"
      filter += ")"
      filter = Net::LDAP::Filter.construct(filter)
    end
  end
end
