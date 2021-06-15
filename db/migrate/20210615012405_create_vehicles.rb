class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :vehicle_model, null: false, foreign_key: true
      t.integer    :year,          null: false 
      t.float      :mileage,       null: false, default: 0
      t.float      :price,         null: false

      t.timestamps
    end
    add_index :vehicles, :mileage
    add_index :vehicles, :price
    add_index :vehicles, :year
  end
end
