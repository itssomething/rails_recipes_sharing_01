class SearchController < ApplicationController
  def index
    @recipes = Recipe.search(params[:reci]).sort_by_name
            .page(params[:page]).per Settings.recipe_new
  end
end
