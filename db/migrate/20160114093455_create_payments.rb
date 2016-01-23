class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.date :date
      t.string :method
      t.references :user
    end
    create_table :notes do |t|
      t.references :user
      t.string :content
      t.references :meeting
    end
    create_table :meetings do |t|
      t.datetime :datetime
      t.integer :duration
      t.references :user
      t.references :locations
      t.boolean :paid
    end
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :rate
      t.string :rate_type
    end
    create_table :assessments do |t|
      t.references :user
      t.references :tag
    end
    create_table :tags do |t|
      t.string :name
    end
  end
end
