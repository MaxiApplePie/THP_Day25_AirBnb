class AddFKs < ActiveRecord::Migration[5.2]
  def change
    add_reference :accomodations, :city, foreign_key: true
    add_reference :reservations, :accomodation, foreign_key: true
    add_reference :reservations, :user, foreign_key: true
  end
end
