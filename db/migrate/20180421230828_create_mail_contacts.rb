class CreateMailContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :mail_contacts do |t|
      t.string :name
      t.string :mail
      t.string :phone
      t.text :message

      t.timestamps
    end
  end
end
