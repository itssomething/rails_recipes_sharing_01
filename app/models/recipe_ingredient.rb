class RecipeIngredient < ApplicationRecord
  attr_accessor :temp

  before_save :split

  belongs_to :recipe, class_name: Recipe.name

  def split
    self.name, self.amount,
      self.measurement = temp.split(" ", 3)
  end
end
