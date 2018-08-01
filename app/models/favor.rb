class Favor < ApplicationRecord
  belongs_to :user
  belongs_to :targetable, polymorphic: true

  enum status: [:like_comment, :like_recipe, :favor_recipe]

  scope :rela, ->(user_id, targetable){where user_id: user_id, targetable: targetable}
end
