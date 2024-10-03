class Apartment < ApplicationRecord
    has_many :apartment_residents
    has_many :residents, through: :apartment_residents
    has_many :vehicles
    has_many :deliveries
end
