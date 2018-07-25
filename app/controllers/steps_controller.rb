class StepsController < ApplicationController
  def index; end

  def show; end

  def new
    @recipe.steps.build
  end
end
