class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :category_recipes, dependent: :destroy
  has_many :category, through: :category_recipes
  has_many :comments, dependent: :destroy
  belongs_to :user

  scope :desc, ->{order created_at: :desc}
  scope :hot_recipe, ->{where "created_at >= ?", Settings.hot_recipe.day.ago}
  scope :feed, ->(f_ids, id){where("user_id IN (?) OR user_id = ?", f_ids, id)}
  scope :search, ->(reci){where "name LIKE ?", "%#{reci}%"}
  scope :sort_by_name, ->{order name: :desc}

  accepts_nested_attributes_for :steps, allow_destroy: true,
    reject_if: proc{|attributes| attributes["content"].blank?}
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  validates :name, :description, :purpose, :ready_in,
    :difficult_level, presence: true
end
