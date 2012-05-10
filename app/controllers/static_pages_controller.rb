class StaticPagesController < ApplicationController
  def index
    if admin_signed_in?
      redirect_to rails_admin_path
    elsif user_signed_in?
      redirect_to users_path
    end
  end
end
