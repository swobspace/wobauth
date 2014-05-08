require "wobauth/engine"
require "devise"

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
  

end
