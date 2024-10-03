class CreateApartmentResidents < ActiveRecord::Migration[7.2]
  def change
    create_table :apartment_residents do |t|
      t.references :apartment, null: false, foreign_key: true
      t.references :resident, null: false, foreign_key: true
      t.string :relationship_type, null: false # "owner" or "renter"
      t.datetime :start_date, null: false
      t.datetime :end_date

      t.timestamps
    end
  end
end