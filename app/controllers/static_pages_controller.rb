class StaticPagesController < ApplicationController
  def home
    @categories = Category.order_by_name
    @categorieshome = Category.order_by_name.page(params[:page])
                              .per Settings.num_category
    @recipes = Recipe.limit(Settings.limit_recipe).hot_recipe
  end
end
