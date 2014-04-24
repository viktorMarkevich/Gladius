# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'A'
    last_name 'B'
    birthday '2014-12-01'
    sequence(:email) { |n| "foo#{n}@example.com" }
    password 'example'
    password_confirmation { password }
    remember_me false
  end

  factory :invalid_user, parent: :user do |f|
    f.first_name nil
  end
end