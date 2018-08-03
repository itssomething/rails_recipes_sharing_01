class RenameTableCategoriesRecipesToCategoryRecipes < ActiveRecord::Migration[5.2]
  def up
    rename_table :categories_recipes, :category_recipes
  end

  def down
    rename_table :category_recipes, :categories_recipes
  end
end
