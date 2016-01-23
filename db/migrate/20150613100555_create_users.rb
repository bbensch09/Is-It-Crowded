class CreateUsers < ActiveRecord::Migration
  ###############################################
  #                                             #
  #     Do NOT change the password schema.      #
  #                                             #
  ###############################################
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :nickname
      t.string :email, :null => false
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :gender
      t.string :phone
      t.date :birthday
      t.string :password_hash
      t.string :avatar_url
      t.references :referrer, index: true
      t.timestamps null: false
    end

    add_index :users, :email, :unique => true

    create_table :auths do |t|
      t.references :user, :null => false
      t.string :unique_id, :null => false
      t.string :service, :null => false
      t.timestamps null: false
    end

    add_index :auths, :unique_id, :unique => true
  end
end
