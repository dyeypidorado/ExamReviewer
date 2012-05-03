class Admin::AdminsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @admin = current_admin
    @admin = Admin.find(@admin.id)
    @exams = @admin.exams.all

    redirect_to admin_exams_path
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      redirect_to admin_admins_path
    else
      render 'edit'
    end
  end

end
