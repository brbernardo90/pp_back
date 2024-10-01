class CreateDeliveries < ActiveRecord::Migration[7.2]
  def change
    create_table :deliveries do |t|
      t.string :block
      t.integer :number
      t.date :received_at
      t.string :reader_code
      t.references :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
