namespace :school do

  desc 'creating 10 schools'
  task :get_10_schools => :environment do
    (0..9).each do |n|
      school = School.new( creator_id: 1, name: "name of school with number #{n}")
      school.save!
    end
  end

end