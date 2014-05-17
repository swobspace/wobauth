FactoryGirl.define do


  sequence :name do |n|
    "name_#{n}"
  end

  factory :authority, class: Wobauth::Authority do
    association :authorizable, factory: :user
    role
  end

  factory :group, class: Wobauth::Group do
    name
  end

  factory :membership, class: Wobauth::Membership do
    user
    group
    auto false
  end

  factory :role, class: Wobauth::Role do
    name
  end

  factory :user, class: Wobauth::User do
    sequence(:username)    { |n| "user#{n}" }
    sequence(:email, 1000) { |n| "user#{n}@example.net" }
    password "test99"
    password_confirmation "test99"
  end

end
