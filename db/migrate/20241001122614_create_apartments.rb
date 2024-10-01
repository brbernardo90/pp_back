class CreateApartments < ActiveRecord::Migration[7.2]
  def change
    create_table :apartments do |t|
      t.string :block
      t.integer :number

      t.timestamps
    end
  end
end
