wobauth
=======

Rails engine providing MVCs for Roles, Groups, Authorities and Memberships
to support authorization of the main application, but no user model and no logic
for authoritations.

The User model is mostly coupled with your application. The concrete
authorization logic too since it has to know which models are available. The rest
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

Since the user model is not included, you have to provide your own user model
and authentication function. Choose something like devise or authlogic, but you
can also build an authentication from scratch.

**THIS APPLICATION IS WORK IN PROGRESS AND NOT FUNCTIONAL YET!**
You will loose all your hair and teeth if you use this application ;-)

Dependencies
------------

* rails >= 4.1
* ruby >= 2.0
* wobapphelpers
* bootstrap v3; must be included by by yourself (via gem or manually)
* simple_form >= 3.1

Installation
------------
TBD

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

Licence
-------

wobauth Copyright (C) 2014  Wolfgang Barth

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

