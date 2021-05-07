class User < ApplicationRecord
  has_many :reservations
  has_many :adm, :class_name => "Adm_host", :foreign_key => "adm_id", optional: true
end
