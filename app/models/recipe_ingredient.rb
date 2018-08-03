class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, class_name: Recipe.name
end
