class CreatePartGroups < ActiveRecord::Migration
  def change
    create_table :part_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
