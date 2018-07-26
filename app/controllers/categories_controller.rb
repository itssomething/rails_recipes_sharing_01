class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    @recipes = @category.recipes.desc.page(params[:page])
                        .per Settings.recipe_per_show
  end
end
