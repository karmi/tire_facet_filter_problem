class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :name
      t.references :category

      t.timestamps
    end
    add_index :makes, :category_id
  end
end
