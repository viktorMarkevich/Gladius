# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    body "MyText"
    school_id 1
    author_id 1
    published false
    to_homepage false
  end
end
