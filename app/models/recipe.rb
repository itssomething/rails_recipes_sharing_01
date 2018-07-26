class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :category_recipes, dependent: :destroy
  has_many :category, through: :category_recipes
  belongs_to :user

  accepts_nested_attributes_for :steps
  scope :desc, ->{order created_at: :desc}
end
