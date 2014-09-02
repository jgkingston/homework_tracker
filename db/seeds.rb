# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = Location.create([{ city: 'Asheville', state: 'NC', blurb: 'Known around the nation as a getaway for adventure seekers and artists, Asheville has built a vibrant tech scene in Western NC. We’re excited about working with local leaders to launch a Green Tech accelerator in the heart of the action (and the mountains).'}, { city: 'Atlanta', state: 'GA', blurb: 'One of the busiest cities in the Southeast, we’re excited to plant roots in a big city full of amazing tech startups and thriving creative culture.'}, { city: 'Austin', state: 'TX', blurb: 'We came to SXSW, ate the BBQ, met a few startups and were hooked. We can’t wait to set up shop in Austin, train developers and keep things as weird as possible.'}, { city: 'Charleston', state: 'SC', blurb: 'One of the most historic places in South Carolina, The Holy City is also turning into a hub of serious technology companies. We’re privileged to partner with them and launch Silicon Harbor’s first intensive code education program.'}, { city: 'Columbia', state: 'SC', blurb: 'The Capitol of The Palmetto state has produced nationally-renowned designers and events, attracting people from all over the country. We are excited to launch our first Web Design course in Columbia and support a growing network of events in partnership with Unmatched Style.'}, { city: 'Durham', state: 'NC', blurb: "Durham, NC also known as 'Bull City' is sandwiched between the state capitol, Raleigh and the college town of Chapel-Hill. Durham is home to the Durham Bulls AAA baseball team and Duke University. It is a hub for start-ups and a center for entrepreneur brain-power."}, { city: 'Greenville', state: 'SC', blurb: 'A sure up-and-comer in the Southeast, Greenville is also the birthplace of The Iron Yard. It’s home to our HQ and paved the way for our first accelerator program, first intensive Academy courses, and first kids classes.'}, { city: 'Houston', state: 'TX', blurb: 'Houston has always been a hub of innovation, spawning technological behemoths like the Johnson Space Center and an exploding healthcare economy. With an up-and-coming tech scene for both enterprise and startup software, The Iron Yard is excited to play a role in the continued growth of all things creative in Houston.'}, { city: 'Orlando', state: 'FL', blurb: "Long known as a vacation destination, Orlando is also home to amazing software companies large and small as well as an established media industry. We're excited to be a part of their growing technology economy, training the development talent that will support growing businesses."}])

courses = Course.create([{title: 'Rails Engineering'}, {title: 'Front-End Engineering'}, {title: 'Web Design'}, {title: 'Mobile Engineering'}])

locations.each do |location|
  password = "#{Faker::Internet.password(8)}"
  first_name = Faker::Name.first_name
  location.users.create(last_name: "#{Faker::Name.last_name}", first_name: first_name, git_username: first_name.downcase ,email: "#{Faker::Internet.email}", password: password, password_confirmation: password, role: 3)
  split = rand(2..4)
  Offering.create(location_id: location.id, course_id: "#{rand(1...split)}")
  Offering.create(location_id: location.id, course_id: "#{rand(split..4)}")
end

locations.each do |location|
  location.offerings.each do |offering|
    Cohort.create(location_id: offering.location_id, course_id: offering.course_id, start_date: '01/12/2015')
  end
end

cohorts = Cohort.all

cohorts.each do |cohort|
  3.times do 
    Assignment.create(summary: "#{Faker::Hacker.adjective} #{Faker::Commerce.product_name}", instructions: "#{Faker::Hacker.say_something_smart}", cohort_id: cohort.id)
  end
  assignments = cohort.assignments.all
  5.times do 
    password = "#{Faker::Internet.password(8)}"
    first_name = Faker::Name.first_name
    cohort.users.create(last_name: "#{Faker::Name.last_name}", first_name: first_name, git_username: first_name.downcase ,email: "#{Faker::Internet.email}", password: password, password_confirmation: password, role: 0)
  end
  students = cohort.users.all
  students.each do |student|
    assignments.each do |assignment|
      assignment.comments.create(content: "#{Faker::Lorem.sentences}", user_id: student.id)
      workflow_states = ['new', 'reviewing', 'complete', 'incomplete']
      assignment.submissions.create(title: "my #{assignment.summary}", notes: "#{Faker::Hacker.say_something_smart}", user_id: student.id, assignment_id: assignment.id, repo: assignment.summary.gsub(/ /, '_').gsub('-', '_'), workflow_state: workflow_states[rand(0..3)])
    end
  end
  1.times do
    password = "#{Faker::Internet.password(8)}"
    first_name = Faker::Name.first_name
    instructor = cohort.users.create(last_name: "#{Faker::Name.last_name}", first_name: first_name, git_username: first_name.downcase ,email: "#{Faker::Internet.email}", password: password, password_confirmation: password, role: 2)
    cohort.assignments.each do |assignment|
      assignment.comments.create(content: "#{Faker::Lorem.sentences}", user_id: instructor.id)
      assignment.submissions.each do |submission|
        submission.comments.create(content: "#{Faker::Lorem.sentences}", user_id: instructor.id)
      end
    end
  end
  1.times do 
    password = "#{Faker::Internet.password(8)}"
    first_name = Faker::Name.first_name
    cohort.users.create(last_name: "#{Faker::Name.last_name}", first_name: first_name, git_username: first_name.downcase ,email: "#{Faker::Internet.email}", password: password, password_confirmation: password, role: 1)
  end
end



  
