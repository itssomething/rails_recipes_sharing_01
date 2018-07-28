class Category < ApplicationRecord
  has_many :category_recipes, dependent: :destroy
  has_many :recipes, through: :category_recipes

  scope :order_by_name, ->{order :name}
end
