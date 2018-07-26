class AddPeopleNumToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :people_num, :integer
  end
end
