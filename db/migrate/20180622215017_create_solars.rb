class CreateSolars < ActiveRecord::Migration[5.0]
  def change
    create_table :solars do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :state
      t.string :place
      t.string :current_price
      t.string :connection_type
      t.string :status

      t.timestamps
    end
  end
end
