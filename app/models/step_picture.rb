class StepPicture < ApplicationRecord
  mount_uploader :picture, PhotoUploader
  belongs_to :step
end
