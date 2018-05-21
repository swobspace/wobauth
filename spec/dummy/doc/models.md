Models for testing plugin features
===================================

Home
----

    bin/rails g controller Home index

Post
----

    bin/rails g scaffold Post subject:string message:text category:references

Category
----

    bin/rails g scaffold Category name:string
