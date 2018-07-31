class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create]
  before_action :logged_in_user, only: [:new]
  before_action :correct_user, except: [:show]

  def show
    @recipes = @user.recipes.desc.page(params[:page])
                    .per Settings.user_per_show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome"
      log_in @user
      redirect_to @user
    else
      render :new
    end
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

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_path unless current_user? @user
  end

  def user_params
    params.require(:user).permit :name, :address, :email, :avatar, :password,
      :password_confirmation
  end
end
