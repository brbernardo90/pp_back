class ApartmentResident < ApplicationRecord
    belongs_to :apartment
    belongs_to :resident

    enum relationship_type: {owner: 'owner', renter: 'renter'}

    validates :relationship_type, presence:true
    validates :start_date, presence: true
end
