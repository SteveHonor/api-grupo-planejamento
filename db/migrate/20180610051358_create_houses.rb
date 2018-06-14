class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.integer :bedrooms
      t.string :bathrooms
      t.integer :places
      t.integer :suites
      t.string :price
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :description
      t.string :status
      t.string :kind
      t.string :situation
      t.string :name
      t.string :email
      t.string :phone
      t.string :meters

      t.timestamps
    end
  end
end
