class Step < ApplicationRecord
  belongs_to :recipe
  has_many :step_pictures, dependent: :destroy

  accepts_nested_attributes_for :step_pictures, allow_destroy: true,
    reject_if:
      proc{|attributes| attributes["picture"].blank?}
end
