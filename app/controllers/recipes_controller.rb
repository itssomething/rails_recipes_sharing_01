class RecipesController < ApplicationController
  before_action :find_recipe, only: :show


  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by id: params[:id]
  end

  def new
    @recipe = Recipe.new
    3.times{@recipe.steps.build}
    3.times{@recipe.recipe_ingredients.build}
  end

  def add_step_to_recipe
    @recipe.steps.build
    respond_to do |format|
      format.html{render :new}
      format.js{render layout: false}
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def update; end

  def edit; end

  def destroy; end

  private

  def recipe_params
    params.require(:recipe).permit(:name,
      :description, :purpose, :ready_in, :difficult_level,
      :cover_photo,
      steps_attributes: [:content],
      recipe_ingredients_attributes: [:temp])
  end


  def find_recipe
    @recipe = Recipe.find_by id: params[:id]

    return if @recipe
    flash[:danger] = t ".cant_find"
    redirect_to root_path
  end
end
