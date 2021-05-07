class CreateAccomodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomodations do |t|
      t.string :available_beds
      t.string :price
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_message
      t.integer :adm_id

      t.timestamps
    end
  end
end
