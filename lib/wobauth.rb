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
  @@remote_authentication = true
  # User.devise_modules.include?(:remote_user_authenticatable) won't work

  def self.remote_authentication?
    @@remote_authentication
  end

end
