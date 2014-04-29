# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name 'wing-chun school'
    date_of_foundation '2014-12-01'
    status 'open'
    info 'some text'
    creator_id nil
    fighting_art_id nil
  end
end
#
# factory :invalid_user, parent: :user do |f|
#   f.first_name nil
#   f.last_name nil
#   f.birthday nil
#   f.weight '80.4er'
#   f.password nil
#   f.password_confirmation nil
#   f.remember_me nil
# end
