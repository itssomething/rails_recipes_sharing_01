class CategoryRecipe < ApplicationRecord
  belongs_to :category, class_name: Category.name
  belongs_to :recipe, class_name: Recipe.name
end
