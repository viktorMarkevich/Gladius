# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(0..2).each do |i|
  @contact = User.create(email:"user#{i}@ma.ru", :password => "123456", :password_confirmation => "123456", role: "manager", status: "fighter").build_contact_info
  if @contact.save
    ["emails", "skypes", "sites", "phones"].each do |contact_type|
      @contact.send(contact_type).create
    end
  end
end
