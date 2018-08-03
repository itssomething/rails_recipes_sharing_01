class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
    @recipe.steps.build
    @recipe.recipe_ingredients.build
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.category_ids = params[:recipe][:category_ids]
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find_by id: params[:id]
    @user = @recipe.user
    @favor = Favor.rela current_user.id, @recipe
    @favor1 = Favor.rela_bookmark current_user.id, @recipe
    @comments = @recipe.comments.all
    @comment = @recipe.comments.build
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cover_photo,
      :description, :purpose, :ready_in, :difficult_level, :category_ids,
      :people_num, steps_attributes: [:content, :_destroy, {photos: []}],
      recipe_ingredients_attributes: [:name, :amount, :measurement])
          .merge user_id: current_user.id
  end
end
