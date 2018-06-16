class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.integer :bedrooms, default: 0
      t.integer :bathrooms, default: 0
      t.integer :places, default: 0
      t.integer :suites, default: 0
      t.string :price
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :state
      t.text :description
      t.string :status, default: :pending
      t.string :kind
      t.string :situation
      t.string :name
      t.string :email
      t.string :phone
      t.string :meters
      t.string :code
      t.integer :visits, default: 0

      t.timestamps
    end
  end
end
