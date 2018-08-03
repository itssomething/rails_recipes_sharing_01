class ChangeDescriptionFromRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :description, :text
    change_column :steps, :content, :text
    change_column :users, :address, :text
  end
end
