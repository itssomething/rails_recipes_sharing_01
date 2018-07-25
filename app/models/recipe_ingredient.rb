class RecipeIngredient < ApplicationRecord
  attr_accessor :temp

  before_save :split

  belongs_to :recipe, class_name: Recipe.name

  def split
    self.amount, self.measurement, self.ingredient_name,
       = temp.split(" ", Settings.ingredient_split)
  end
end
