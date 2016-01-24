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

5.times do
	User.create!(unique_user)
end

def unique_post
	{
	created_at: Faker::Time.backward(1, :evening),
	wait_time: ((rand(9)+1)*10),
    body: Faker::Hipster.sentence(4)
    }
end

def create_review
	Review.create!(unique_review)
end

def unique_restaurant
	{
    restaurant_creator_id: (rand(4) + 1),
    name: Faker::Company.name,
    cuisine: Faker::Company.buzzword,    
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip
  }
end

5.times do
	new_listing = Restaurant.create!(unique_restaurant)
	(rand(4)+1).times {new_listing.reviews << create_review}
end

User.create!(email: "test@test.com", password: "12345")

