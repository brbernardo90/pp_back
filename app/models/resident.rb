class Resident < ApplicationRecord
  has_many :apartment_residents
  has_many :apartments, through: :apartment_residents
end
