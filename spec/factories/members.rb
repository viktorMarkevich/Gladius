# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member, parent: :user, class: Member do
    kind 'Member'
  end

  factory :invalid_member, parent: :user, class: Member do
    kind nil
    email nil
  end
end