class Category < ApplicationRecord
  has_many :category_recipes, dependent: :destroy
end
