namespace :school do

  desc 'creating 10 schools'
  task :get_10_schools => :environment do
    school_last_numb = School.count
    (0..9).each do |n|
      school = School.new( creator_id: 1, name: "name of school with number #{n + school_last_numb}")
      school.save!
    end
  end

end