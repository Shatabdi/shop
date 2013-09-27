class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob
      t.string :email
      t.integer :phone
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
