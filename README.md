wobauth
=======

Rails engine providing MVCs for Users, Roles, Groups, Authorities and Memberships
to support authorization of the main application.

The User model is mostly coupled with your application, so Wobauth::User is open classed.
You should overwrite it depending on your needs. See 
test/dummy/app/models/wobauth/user.rb for an example.

You have to build your own concrete authorization logic with cancancan or
something similiar. The basic principle
is always the same. A subject (user or group) has some rights (the role) on
concret objects. The objects may be organizational units, sites, categories
or something else whatever your application provides. The object may be nil
if your application doesn't need this feature. The role define the rights
dependent on your logic, mostly likely read, create, update and destroy.

Roles are intended to be set from migration or seed and not to be edited by
an admin, the logic is mostly hardcoded if based on cancan(can). Users can be
members of group. Memberships are separate model here (not only an plain
many-to-many association) to allow both manual memberships and
automatically created memberships during the login process.

Versions
--------

wobauth 1.x is for Rails 4, wobauth 2.x will support Rails 5.

Dependencies
------------

Branch ''master'':

* rails ~> 4.1
* ruby >= 2.0
* wobapphelpers
* bootstrap v3; must be included by by yourself (via gem, bower or manually)
* simple_form >= 3.1
* devise

wobauth is not Rails5 ready, I am waiting until simple_form supports Rails5. Stay
tuned.

Installation
------------
Add wobauth to your Gemfile:

```ruby
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: 'master'
```
Run

```ruby
rails g wobauth:install
```
to create an example configuration in ''config/initializers/wobauth.rb''

Configuration
-------------

### User model

To customize the user model to your needs, create app/models/wobauth/users.rb in
your application:

```ruby
# main_app/app/models/wobauth/user.rb

class Wobauth::User < ActiveRecord::Base
  include Wobauth::Concerns::Models::User

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  ... add your associations and methods ...
end
```
**DO NOT USE :validatable**, since wobauth uses :username as authentication key
(devise default :email, will be required if you use :validatable). 

### Application controller

```ruby
class ApplicationController < ActionController::Base
  helper Wobauth::ApplicationHelper
  ...
end
```

Helpers for bootstrap navbar:

* `navigation_account_links` : navigation partial for login/userprofile/logout
* `navigation_admin_links` : navigation partial for user/roles/authorities ...

### Authorized_for types

If you have objects for which wobauth should provide authority configuration, 
set your models in the initializer (created by ```rails g wobauth:install```). 
In this example we will use Category from your main application:

```ruby
Wobauth.setup do |config|
  #
  # Configuration for Authorization
  # 1. Subject: Authorizable
  # do not change it unless you know exactly what you are doing
  #
  # config.authorizable_types = [ "Wobauth::User", "Wobauth::Group" ]
  #
  # 2. Object: Authorized_for
  # depends on your application ...
  # default: []
   
  config.authorized_for_types = [ "Category" ]
   
end
```

You can create and delete authority records within wobauth, but you have to build
your own authorization with cancan(can) in your main application.

### Routes
Mount the rails engine:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  mount Wobauth::Engine, at: '/auth'
  ...
end
```

Applications using wobauth
--------------------------
If you are looking for examples using wobauth, have a look at
[boskop](https://github.com/swobspace/boskop). 

Another simple example is the [test/dummy](test/dummy) application
included in this rails engine.

Licence
-------

wobauth Copyright (C) 2014-2016  Wolfgang Barth

MIT license, see [LICENSE](LICENSE)

