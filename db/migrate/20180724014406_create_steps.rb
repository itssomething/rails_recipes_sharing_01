class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :step_order
      t.string :content
      t.string :photo

      t.timestamps
    end
  end
end
