class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

  def new; end

  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = t ".added"
    else
      flash[:warning] = t ".error"
    end
    redirect_to @comment.recipe
  end

  def destroy
    @recipe = Recipe.find_by id: params[:id]
    @comment = @recipe.comment
    @comment.destroy
    redirect_to recipe_path @recipe
  end

  private

  def comment_params
    params.require(:comment).permit(:content,
      :recipe_id).merge user_id: current_user.id
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to root_url unless @micropost
  end
end
