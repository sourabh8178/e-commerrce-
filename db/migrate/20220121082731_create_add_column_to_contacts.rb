class CreateAddColumnToContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :add_column_to_contacts do |t|
      t.string :phone

      t.timestamps
    end
  end
end
