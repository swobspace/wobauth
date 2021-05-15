FactoryBot.define do

  sequence :email, 10000 do |n|
    "person#{n}@example.net"
  end

  sequence :group do |n|
    "group_#{n}"
  end

  sequence :username do |n|
    "user_#{n}"
  end

  sequence :name do |n|
    "name_#{n}"
  end

  factory :authority, class: Wobauth::Authority do
    association :authorizable, factory: :user
    role
  end

  factory :group, class: Wobauth::Group do
    name { generate(:name) }
  end

  factory :membership, class: Wobauth::Membership do
    user
    group
  end

  factory :role, class: Wobauth::Role do
    name { generate(:name) }
  end

  factory :user, class: Wobauth::User do
    username { generate(:username) }
    email { generate(:email) }
    password { "test99" }
    password_confirmation { "test99" }
  end

end
