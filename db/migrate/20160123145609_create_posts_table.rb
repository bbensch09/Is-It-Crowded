class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  	  t.datetime :created_at
  	  t.integer :wait_time
  	  t.string :status, null:false
  	  t.boolean :crowded
  	  t.integer :post_creator_id
 	  t.belongs_to :location, index:true		
      t.timestamps null: false
    end
  end
end
