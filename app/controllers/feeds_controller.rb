class FeedsController < ApplicationController
  def index
    if logged_in?
      @recipes = current_user.feed
    else
      redirect_to root_path
    end
  end
end
