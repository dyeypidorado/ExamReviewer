class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @user = User.find(@user.id)
    #UserMailer.confirm_registration(@user).deliver

    redirect_to user_reviewers_path(@user.id)
  end
end
