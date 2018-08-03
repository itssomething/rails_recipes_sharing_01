class BookmarksController < ApplicationController
  before_action :find_recipe, only: %i(create destroy)

  def create
    return if current_user.bookmarked? @recipe
    if params[:status] == "2"
      @bookmark = Favor.new status: "bookmark_recipe", user: current_user,
        targetable: @recipe
      if @bookmark.save
        @bookmark = Favor.rela_bookmark current_user.id, @recipe
        respond_to do |format|
          format.html {redirect_to @recipe}
          format.js
        end
      else
        flash[:warning] = t ".failed"
      end
    end
end

  def destroy
    @bookmark = Favor.find_by id: params[:id]
    @bookmark.destroy
    respond_to do |format|
      format.html {redirect_to @recipe}
      format.js
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by id: params[:recipe_id]

    return if @recipe
    redirect_to root_path
  end
end
