Dependencies between User model (application) and wobauth models
================================================================

Wobauth initializer
-------------------
The name of the User class may vary, so the class name should
be set in an initializer as mentioned in 
http://guides.rubyonrails.org/engines.html#configuring-an-engine

```ruby
# config/initializers/wobauth.rb
Wobauth.setup do |config|
  config.user_class = "User" # must be a String!
  ...
end
```

Authority
---------

```ruby
module Wobauth
  class Authority < ActiveRecord::Base
    belongs_to :role
    belongs_to :authorizable, polymorphic: true
    belongs_to :rights_on,    polymorphic: true
    ...
  end
end
```


Group
-----

```ruby
module Wobauth
  class Group < ActiveRecord::Base
    has_many :authorities, as: :authorizable
    has_many :roles,       through: :authorities
    has_many :memberships
    has_many :users,       through: :memberships, uniq: true,
                           source:  Wobauth.user_class.to_s
    ...
  end
end
```

Membership
----------

```ruby
module Wobauth
  class Membership < ActiveRecord::Base
    belongs_to :group
    belongs_to :user, class_name: Wobauth.user_class.to_s
    ...
  end
end
```

Role (wobauth)
--------------

```ruby
module Wobauth
  class Membership < ActiveRecord::Base
    has_many :authorities
    has_many :users,  through:     :authorities,
                      source:      :authorizable,
                      source_type: Wobauth.user_class.to_s
    ...
  end
end
```

User (application)
------------------

```ruby
class User < ActiveRecord::Base
  has_many :authorities, as: :authorizable, dependent: :destroy
  has_many :roles,       through: :authorities
  has_many :memberships, dependent: :destroy
  has_many :group_roles, through: :groups, source: :roles
  has_many :groups,      through: :memberships, uniq: true
  ...
end
```
