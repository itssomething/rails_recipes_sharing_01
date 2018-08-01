class CreateFavors < ActiveRecord::Migration[5.2]
  def change
    create_table :favors do |t|
      t.integer :targetable_id
      t.string :targetable_type
      t.integer :status
      t.belongs_to :targetable, polymorphic: true

      t.timestamps
    end
    add_index :favors, :targetable_id
    add_index :favors, :targetable_type
  end
end
