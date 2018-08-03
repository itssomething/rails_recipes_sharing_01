class Favor < ApplicationRecord
  belongs_to :user
  belongs_to :targetable, polymorphic: true

  enum status: {like_comment: 0, like_recipe: 1, bookmark_recipe: 2}

  scope :rela, ->(user_id, targetable){where user_id: user_id, targetable: targetable, status: 1}
  scope :rela_bookmark, ->(user_id, targetable){where user_id: user_id, targetable: targetable, status: 2}
end
