class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.references :make

      t.timestamps
    end
    add_index :models, :make_id
  end
end
