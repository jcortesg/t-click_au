class CreateVehicleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_models do |t|
      t.string :name, null: false
      t.references :vehicle_brand, null: false, foreign_key: true
    end
    
    add_index :vehicle_models, :name, unique: true
  end
end
