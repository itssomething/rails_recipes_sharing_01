class StaticPagesController < ApplicationController
  def home
    @categories = Category.oder_by_name
  end
end
