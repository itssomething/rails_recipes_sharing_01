class FavorsController < ApplicationController

  def create
    @recipe = Recipe.find_by id: params[:recipe_id]

    return if current_user.liked? @recipe
    @favor = Favor.new(status: "like_recipe", user: current_user,
      targetable: @recipe)

    if @favor.save
      @favor = Favor.rela current_user.id, @recipe
      respond_to do |format|
        format.html {redirect_to @recipe}
        format.js
      end
    else
      flash[:warning] = t ".failed"
    end
  end

  def destroy
    @recipe = Recipe.find_by id: params[:recipe_id]
    @favor = Favor.find_by id: params[:id]
    @favor.destroy
    respond_to do |format|
      format.html {redirect_to @recipe}
      format.js
    end
  end

  private

  def favor_params
    params.require(:favor).permit(:targetable_type, :status).merge(user_id: current_user.id).merge targetable_id: params[:id]
  end
end
