class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :category_recipes, dependent: :destroy
  has_many :category, through: :category_recipes
  belongs_to :user

  scope :desc, ->{order created_at: :desc}

  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  validates :name, :description, :purpose, :ready_in, :difficult_level, presence: true
end
