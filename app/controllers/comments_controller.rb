class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy
  before_action :find_user, only: %i(create destroy)

  def new; end

  def create
    @comment = Comment.new comment_params

    if @comment.save
      respond_to do |format|
        format.html{redirect_to @recipe}
        format.js{render layout: false}
      end
    else
      render js: "alert(I18n.t('empty_comment_alert'))"
    end
  end

  def destroy
    @comment = @recipe.comments.find_by id: params[:id]
    @comment.destroy
    respond_to do |format|
      format.html{redirect_to recipe_path @recipe}
      format.js
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by id: params[:recipe_id]
  end

  def comment_params
    params.require(:comment).permit(:content,
      :recipe_id).merge user_id: current_user.id
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to root_url unless @comment
  end
end
