class CreateStepPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :step_pictures do |t|
      t.integer :step_id
      t.string :picture

      t.timestamps
    end
  end
end
