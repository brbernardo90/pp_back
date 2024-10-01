class Apartment < ApplicationRecord
    has_many :residents
    has_many :vehicles
    has_many :deliveries
end
