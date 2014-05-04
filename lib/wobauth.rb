require "wobauth/engine"

module Wobauth

  def self.setup
    yield self
  end

  # class_name for the user model of your application.
  # Default: "User"
  #
  mattr_accessor :user_class
  @@user_class = "User"

  def self.user_class
    @@user_class.constantize
  end

  # returns the user_class as underscored symbol for source: statements
  def self.user_source
    @@user_class.underscore.to_sym
  end

  # authorizable types
  #
  mattr_reader :authorizable_types 
  @@authorizable_types = [ "User", "Wobauth::Group" ]
  
  # authorized_for types
  # Objects on which Wobauth should set authorization
  #
  mattr_accessor :authorized_for_types 
  @@authorized_for_types = [ ]
  

end
