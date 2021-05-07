class Accomodation < ApplicationRecord
  has_many :reservations
  belongs_to :adm, :class_name => "User", :foreign_key => "adm_id"
  belongs_to :city
end
