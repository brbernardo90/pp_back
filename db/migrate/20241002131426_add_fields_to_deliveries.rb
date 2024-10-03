class AddFieldsToDeliveries < ActiveRecord::Migration[7.2]
  def change
    # Change the type of received_at from date to datetime
    change_column :deliveries, :received_at, :datetime

    # Add the new fields
    add_column :deliveries, :status, :boolean, default: false, null: false
    add_column :deliveries, :deliveried_at, :datetime
    add_column :deliveries, :received_img, :text, limit: 7000 # Long text for large images
    add_column :deliveries, :deliveried_img, :text, limit: 7000 # Long text for large images
  end
end
