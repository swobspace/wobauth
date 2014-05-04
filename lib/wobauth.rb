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

  def self.user_source
    @@user_class.underscore.to_sym
  end

end
