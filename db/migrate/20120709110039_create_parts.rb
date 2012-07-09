class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :description
      t.references :part_group

      t.timestamps
    end
    add_index :parts, :part_group_id
  end
end
