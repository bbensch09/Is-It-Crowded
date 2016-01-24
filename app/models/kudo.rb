class Kudo < ActiveRecord::Base
	belongs_to :post
	belongs_to :kudo_creator, class_name: "User"
end	
