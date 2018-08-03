class Step < ApplicationRecord
  belongs_to :recipe
  mount_uploaders :photos, PhotoUploader
end
