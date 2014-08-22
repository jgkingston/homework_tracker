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
  Offering.create(location_id: location.id, course_id: "#{rand(1..4)}")
end
  
