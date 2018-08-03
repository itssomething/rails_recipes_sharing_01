class CategoryRecipe < ApplicationRecord
  belongs_to :category, class_name: Category.name
end
