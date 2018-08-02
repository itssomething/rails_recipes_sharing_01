class AddPhotosFromSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :photos, :json
  end
end
