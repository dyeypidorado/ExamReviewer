class Admin::ExamsController < ApplicationController
  before_filter :authenticate_admin!
   
  def index
    @exam = current_admin.exams
  end
  
  def new
    @exam = current_admin.exams.new
  end
  
  def create
    new_exam = current_admin.exams.new(params[:exam])
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
