require 'faker'

User.delete_all
Post.delete_all
Kudo.delete_all
Point.delete_all


def unique_user
	{
	  password: "password",	  
	  email: Faker::Internet.email,
	}
end

20.times do
	User.create!(unique_user)
end

def unique_post
	{
	created_at: Faker::Time.backward(1, :evening),
	wait_time: ((rand(9)+1)*10),
	status: "Active",
	crowded: rand(2) == 1 ? true : false,
	post_creator_id: (rand(20)+1),
	location_id: (rand(20)+1)
    }
end

def create_post
	Post.create!(unique_post)
end

def unique_location
	{
    location_creator_id: (rand(2) + 1),
    name: Faker::Company.name,
    cuisine: Faker::Company.buzzword,    
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    phone: Faker::PhoneNumber.cell_phone,
    type: rand("Bar","Restaurant"),
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude
  }
end

def unique_kudo
	{
		kudo_creator_id: (rand(20)+1),
		post_id: (rand(20)+1),
		value: 1
	}
end

def create_kudo
	Kudo.create!(unique_kudo)
end

5.times do
	new_location = Location.create!(unique_location)
	(rand(3)+1).times {new_location.posts << create_post}
	new_location.posts.each do |post|
		(rand(3)+1).times {post.kudos << create_kudo}
	end
end

User.create!(email: "test@test.com", password: "12345")

