Used generators
================

Plugin new
----------

    rails plugin new wobauth --mountable --no-skip-test-unit

Role
----

    bin/rails g scaffold Role name:string --no-skip-test-unit

Group
----

    bin/rails g scaffold Group name:string description:string --no-skip-test-unit

Membership
----

    bin/rails g scaffold Membership user:references group:references \
                auto:boolean --no-skip-test-unit

Authority
----

    bin/rails g scaffold Authority \
                authorizable:references authorizable_type:string \
                role:references \
                authorized_for:references authorized_for_type:string \
                valid_from:date valid_until:date \
                --no-skip-test-unit

## User (controller only, rest was done by devise)

    bin/rails g scaffold_controller User username:string gruppen:text sn:string \
           givenname:string displayname:string telephone:string \
           email:string --no-skip-test-unit

   bin/rails g migration AdditionalFieldsToUser \
	       title:string position:string department:string company:string

Login

    bin/rails g controller Login login
