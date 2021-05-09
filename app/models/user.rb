class User < ApplicationRecord
  has_many :reservations
  has_many :accomodations, foreign_key: "adm_id", class_name: "Accomodation"
  validates :email,
            presence: true,
            format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :phone_number,
            presence: true,
            format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
end
