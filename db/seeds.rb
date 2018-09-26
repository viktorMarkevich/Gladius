# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..2).each do |i|
  user = User.new( email:"user#{i}@ma.ru", first_name: "first_name#{i}", last_name: "last_name#{i}", password: '123456', weight: 82.1,
                  password_confirmation: '123456', role: 'manager' )
  user.build_contact_info
  user.build_image
  user.save
end

  school_last_numb = School.count
  User.all.each do |user|
    (0..9).each do |n|
      school = School.new( creator_id: user.id , name: "School of #{user.login} with number #{n + school_last_numb}")
      school.user_school_relations.build(member_id: user.id)
      school.save
    end
  end