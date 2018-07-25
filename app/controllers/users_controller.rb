class UsersController < ApplicationController
  before_action :find_user
  def show
    @recipes = @user.recipes.desc.page(params[:page])
                    .per Settings.user_per_show
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".save_success"
      redirect_to @user
    else
      flash[:danger] = t ".save_failed"
      render :edit
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".cant_find"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :address, :email, :avatar
  end
end
