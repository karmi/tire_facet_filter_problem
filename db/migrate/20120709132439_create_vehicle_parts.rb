class CreateVehicleParts < ActiveRecord::Migration
  def change
    create_table :vehicle_parts do |t|
      t.references :part
      t.references :vehicle

      t.timestamps
    end
    add_index :vehicle_parts, :part_id
    add_index :vehicle_parts, :vehicle_id
  end
end
