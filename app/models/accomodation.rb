class Accomodation < ApplicationRecord
  has_many :reservations
  belongs_to :adm, class_name: "User"
  belongs_to :city
  validates :available_beds,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :price,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
  validates :description,
            presence: true,
            length: { minimum: 140 }
  validates :welcome_message, presence: true
end
