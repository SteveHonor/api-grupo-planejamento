class CreateHouseImages < ActiveRecord::Migration[5.0]
  def change
    create_table :house_images do |t|
      t.references :house, foreign_key: true
      t.text :image

      t.timestamps
    end
  end
end
