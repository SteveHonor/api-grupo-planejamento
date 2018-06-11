class CreateMailNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_newsletters do |t|
      t.string :mail
      t.string :origin
      t.boolean :status

      t.timestamps
    end
  end
end
