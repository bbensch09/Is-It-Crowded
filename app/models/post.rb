class Post < ActiveRecord::Base
	belongs_to :post_creator, class_name: "User"
	belongs_to :location
	has_many :kudos

  def time_since_creation
    ((Time.now - created_at) / 60).round
  end
  
end
