class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :cover_photo
      t.string :purpose
      t.string :ready_in
      t.string :difficult_level

      t.timestamps
    end
  end
end
