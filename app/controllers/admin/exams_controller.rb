class Admin::ExamsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @admin = Admin.find(current_admin.id)
    @exam = @admin.exams
  end

  def new
    @admin = Admin.find(current_admin.id)
    @exam = @admin.exams.new
  end

  def create
    @admin = Admin.find(current_admin.id)
    new_exam = @admin.exams.new(params[:exam])
    if new_exam.save
      redirect_to admin_exams_path
    else
      render 'new'
    end
  end

  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    redirect_to admin_exams_path
  end
end
