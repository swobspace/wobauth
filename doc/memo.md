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

