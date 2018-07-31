class Comment < ApplicationRecord
  belongs_to :user, class_name: User.name
  belongs_to :recipe, class_name: Recipe.name

  validates :content, presence: true
end
