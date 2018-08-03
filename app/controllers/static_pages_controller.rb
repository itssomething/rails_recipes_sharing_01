class StaticPagesController < ApplicationController
  def home
    @categories = Category.order_by_name
    @categorieshome = Category.order_by_name.page(params[:page])
                              .per Settings.num_category
    @recipes = Recipe.limit(Settings.limit_recipe).hot_recipe
    @topusers = User.limit(Settings.limit_top_user_home).top_user
  end
end
