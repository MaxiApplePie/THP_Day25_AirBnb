class AlterAccomodation < ActiveRecord::Migration[5.2]
  def change
    change_column :accomodations, :available_beds, :integer, using: "available_beds::integer"
    change_column :accomodations, :price, :integer, using: "price::integer"
  end
end
