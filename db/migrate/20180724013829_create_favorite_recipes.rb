class CreateFavoriteRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_recipes do |t|

      t.timestamps
    end
  end
end
