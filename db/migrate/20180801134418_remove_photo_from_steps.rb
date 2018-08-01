class RemovePhotoFromSteps < ActiveRecord::Migration[5.2]
  def change
    remove_column :steps, :photo
  end
end
