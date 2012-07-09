class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :body_type
      t.integer :power
      t.integer :capacity
      t.integer :year_from
      t.integer :year_to
      t.references :make
      t.references :model

      t.timestamps
    end
    add_index :vehicles, :make_id
    add_index :vehicles, :model_id
  end
end
