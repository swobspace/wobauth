FactoryBot.define do

  factory :authority, class: Wobauth::Authority do
    association :authorizable, factory: :user
    role
  end

  factory :group, class: Wobauth::Group do
    sequence(:name) { |n| "name_#{n}" }
  end

  factory :membership, class: Wobauth::Membership do
    user
    group
    auto false
  end

  factory :role, class: Wobauth::Role do
    sequence(:name) { |n| "name_#{n}" }
  end

  factory :user, class: Wobauth::User do
    sequence(:username)    { |n| "user#{n}" }
    sequence(:email, 1000) { |n| "user#{n}@example.net" }
    password "test99"
    password_confirmation "test99"
  end

end
