class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    3.times {@recipe.steps.build}
    3.times {@recipe.recipe_ingredients.build}
    # @recipe.steps.build
    # @recipe.recipe_ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by id: params[:id]
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,
      :description, :purpose, :ready_in, :difficult_level,
      steps_attributes: [:content],
      recipe_ingredients_attributes: [:temp])
  end

end
