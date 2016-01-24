class CreateKudosTable < ActiveRecord::Migration
  def change
  	create_table :kudos do |t|
  	  t.integer :kudo_creator_id
  	  t.belongs_to :post, index:true
  	  t.integer :value
  	  t.timestamps null: false
    end
  end
end
