class RemoveApartmentRefFromResident < ActiveRecord::Migration[7.2]
  def change
    remove_reference :residents, :apartment, null: false, foreign_key: true
  end
end
