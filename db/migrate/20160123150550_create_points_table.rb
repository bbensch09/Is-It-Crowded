class CreatePointsTable < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id, index: true
      t.integer :value
      t.timestamps null: false
    end
  end
end
