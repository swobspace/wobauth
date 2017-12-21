require "wobauth/engine"

module Wobauth

  def self.setup
    yield self
  end

  # authorizable types
  #
  mattr_reader :authorizable_types 
  @@authorizable_types = [ "Wobauth::User", "Wobauth::Group" ]
  
  # authorized_for types
  # Objects on which Wobauth should set authorization
  #
  mattr_accessor :authorized_for_types 
  @@authorized_for_types = [ ]
  
  # is remote authentication possible using REMOTE_USER?
  # default: check devise settings
  mattr_writer :remote_authentication
  @@remote_authentication = nil

  def self.remote_authentication?
    if @@remote_authentication.nil?
      @@remote_authentication = User.devise_modules.include?(:remote_user_authenticatable)
    end
    @@remote_authentication
  end

  # config file for ldap settings
  #
  mattr_writer :ldap_config
  @@ldap_config = nil


  def self.ldap_options
    return {} if @@ldap_config.blank?
    if File.readable? @@ldap_config
      config = YAML.load_file(@@ldap_config)
    end
    config ||= Hash.new

    if config['ldap_options'].present?
      opts = config['ldap_options'].symbolize_keys
      opts.each do |k,v|
        opts[k] = opts[k].symbolize_keys if opts[k].kind_of? Hash
      end
    else
      nil
    end
  end

end
