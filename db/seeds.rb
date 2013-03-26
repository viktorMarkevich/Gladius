# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..2).each do |i|
  user = User.new(email:"user#{i}@ma.ru", :password => "123456",
                  :password_confirmation => "123456", :role => "manager")
  user.build_contact_info
  user.save
end
