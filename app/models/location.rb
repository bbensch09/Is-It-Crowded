class Location < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  belongs_to :location_creator, class_name: "User"
  
end
