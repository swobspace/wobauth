Wobauth.setup do |config|
  config.authorized_for_types = ["Category"]
  config.ldap_config = ENV['LDAP_CONFIG']
end
