class CreateVehicles < ActiveRecord::Migration[7.2]
  def change
    create_table :vehicles do |t|
      t.integer :type
      t.string :make
      t.string :color
      t.string :plate
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
