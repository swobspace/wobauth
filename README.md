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
wobauth 3.x uses bootstrap v4 and font-awesome, starting with Rails 5.1 
(may work with Rails 5.0, but not tested)
wobauth 4.x works with sprockets v4.
wobauth 5.x works with rails 6.x and is designed for autoloading via zeitwerk.
wobauth 5.2 works with @hotwire/turbo but has data-turbo: false in forms enabled; 
the main purpose is for backwards compatibility with bootstrap v4 application during
upgrade process. For bootstrap v5 and @hotwire/turbo please use wobauth v7.

Requirements
------------

### Rails >= 6.0; autoload = :zeitwerk; webpacker; stimulusjs

| branch     | rails | ruby   | bootstrap | icons           | wobapphelpers |
|------------|-------|--------|-----------|-----------------|---------------|
| 5-2-stable | >=6.0 | >= 2.6 |  v4       | fontawesome 5.x | master (4.x)  |
| 5-1-stable | >=6.0 | >= 2.6 |  v4       | fontawesome 5.x | master (4.x)  |

### Rails >= 6.0, autoload = :zeitwerk

| branch     | rails | ruby   | bootstrap | icons           | wobapphelpers |
|------------|-------|--------|-----------|-----------------|---------------|
| 5-stable   | >=6.0 | >= 2.6 |  v4       | fontawesome 5.x | master (4.x)  |

### Rails <= 5.2, autoload = :classic

| branch     | rails | ruby   | bootstrap | icons           | wobapphelpers |
|------------|-------|--------|-----------|-----------------|---------------|
| 4-0-stable | >=5.1 | >= 2.3 |  v4       | fontawesome 5.x | master (4.x)  |
| 3-0-stable | >=5.1 | >= 2.3 |  v4       | fontawesome 4.7 | 3-0-stable    |
| 2-0-stable |  5.0  | >= 2.2 |  v3       | glyphicons      | 2-0-stable    |
| 1-0-stable |  4.2  | >= 2.0 |  v3       | glyphicons      | 1-0-stable    |


* simple_form >= 3.3

Installation
------------
Add wobauth to your Gemfile:

```ruby
gem 'wobauth', '~> 5.0.0'
gem 'wobauth', '~> 4.0.0'
gem 'wobauth', '~> 3.4.8'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: '3-0-stable'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: '2-0-stable'
gem 'wobauth', git: 'https://github.com/swobspace/wobauth.git', branch: '1-0-stable'

```
Starting with v3.4 gems are published to rubygems.org. 

Run
```ruby
rails g wobauth:install
```
to create an example configuration in ''config/initializers/wobauth.rb''

```ruby
rake wobauth:install:migrations
```
copies wobauth migration files wobauth to your application. Do this before you
create your own migration files if possible. If you upgrade from an older wobauth
version rerun it. There might be new migration files added.


Upgrade
-------

For Upgrade from 3.x to 4.x you have to upgrade wobapphelpers

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

### Views

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
  ...
  mount Wobauth::Engine, at: '/auth'
end
```

With rails 5.1 there are some problems with engine routing in engines.
Add the `mount` statement at the bottom of `Rails.application.routes.draw` and
use always a suburl for mount like `/auth`. Don't use `/`.

Using datatables
--------------------------

Wobauth comes with support for datatables. To select the tables, use the
following jQuery selector:

```ruby
$('table[role="wobauth_datatable"]')
```

`$('dataTable')` may be removed in a future release.

Applications using wobauth
--------------------------
If you are looking for examples using wobauth, have a look at
[boskop](https://github.com/swobspace/boskop). 

Another simple example is the [test/dummy](test/dummy) application
included in this rails engine.

Licence
-------

wobauth Copyright (C) 2014-2023  Wolfgang Barth

MIT license, see [LICENSE](LICENSE)

