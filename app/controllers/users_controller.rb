class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    unless current_user.update(user_params)
      render :edit and return
    end

    redirect_to action: "show"
  end

  private

  def user_params
    params.require(:user)
      .permit(:username, :profile, :image)
  end
end
