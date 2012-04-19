class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = current_user
  end
    
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:name])
      redirect_to users_path
    else
      render 'edit'
    end
  end

end
