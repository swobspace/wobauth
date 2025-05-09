require 'yaml'
module Wobauth
  class LDAP
    attr_reader :ldap_options, :connection, :ldap_filter

    # instance methods
    def initialize(options = {})
      options = options.symbolize_keys
      @ldap_options = options.fetch(:ldap_options)
      @connection   = init_connection(@ldap_options)
      @ldap_filter  = default_ldap_filter

    end

    def ldap_filter=(options)
      # to overwrite existing filter
    end

    def init_connection(options)
      Net::LDAP.new(options)
    end

    # class methods
    class << self
      # wobauth_ldap_instances = Wobauth::LDAP.setup(yamlfile)
      # read yaml config file with ldap options
      # and returns an array of Wobauth::LDAP instances
      def setup(filename)
        
      end
    end

  private
    def default_ldap_filter
      # set a Net::LDAP::Filter
    end
  end
end
