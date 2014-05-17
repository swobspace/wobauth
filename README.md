wobauth
=======

Rails engine providing MVCs for Users, Roles, Groups, Authorities and Memberships
to support authorization of the main application.

The User model is mostly coupled with your application, so Woauth::User is open classed.
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

Dependencies
------------

* rails >= 4.1
* ruby >= 2.0
* wobapphelpers
* bootstrap v3; must be included by by yourself (via gem or manually)
* simple_form >= 3.1
* devise

Installation
------------
Add wobauth to your Gemfile:

```ruby
gem 'wobauth', git: 'git@github.com:swobspace/wobauth.git', branch: 'master'
```
Run

```ruby
rails g wobauth:install
```
to create an example configuration in ''config/initializers/wobauth.rb''

Configuration
-------------
TBD

Deployment
----------
TBD

Applications using wobauth
--------------------------
If you are looking for examples using wobauth, have a look at
[boskop](https://github.com/swobspace/boskop). BTW the project
isn't really started. Stay tuned and try it again in a few weeks.

Another simple example is the [test/dummy](test/dummy) application
included in this rails engine.

Licence
-------

wobauth Copyright (C) 2014  Wolfgang Barth

MIT license, see [LICENSE](LICENSE)

