class CreateVehicleBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_brands do |t|
      t.string :name, null: false
    end

    add_index :vehicle_brands, :name, unique: true
  end
end
