Wobauth.setup do |config|
  #
  # Configuration for Authorization
  # 1. Subject: Authorizable
  # do not change it unless you know exactly what you are doing
  #
  # config.authorizable_types = [ "Wobauth::User", "Wobauth::Group" ]
  # config.authorizable_group_method = :all
  #
  # 2. Object: Authorized_for
  # depends on your application ...
  # default: []
  #
  # config.authorized_for_types = [ "MyClass", ...]
  # config.authorized_for_group_method = :all
  #
  # or for ancestry trees:
  # config.authorized_for_group_method = :arrange_as_array
  #
  # use ldap authentication strategy first
  # config.enable_ldap_authenticatable = true
  #
  # turbo streams custom actions
  # config.custom_stream_actions = true
end
