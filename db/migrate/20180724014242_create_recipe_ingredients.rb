class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.string :name
      t.string :amount
      t.string :measurement

      t.timestamps
    end
  end
end
