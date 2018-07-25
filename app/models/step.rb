class Step < ApplicationRecord
  belongs_to :recipe

  # scope :list_steps_content, -> (recipe_id){
  #   where(recipe_id: recipe_id).select("content")
  # }
end
