class CreateResidents < ActiveRecord::Migration[7.2]
  def change
    create_table :residents do |t|
      t.string :name
      t.string :phone
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
