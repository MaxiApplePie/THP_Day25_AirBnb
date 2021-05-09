class AddFk2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :accomodations, :users, column: :adm_id
  end
end
