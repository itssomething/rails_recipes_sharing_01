class RecipesController < ApplicationController
  before_action :find_recipe

  def show
    @user = @recipe.user
  end

  private

  def find_recipe
    @recipe = Recipe.find_by id: params[:id]

    return if @recipe
    flash[:danger] = t ".cant_find"
    redirect_to root_path
  end
end
