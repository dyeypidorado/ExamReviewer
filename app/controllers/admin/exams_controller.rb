class Admin::ExamsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @admin = Admin.find(current_admin.id)
    @exam = @admin.exams.all
  end

  def new
    @admin = Admin.find(current_admin.id)
    @exam = @admin.exams.new
    1.times do
      @question = @exam.questions.build
      3.times { @question.choices.build }
    end
  end

  def edit
    @admin = Admin.find(current_admin.id)
    @exam = @admin.exams.find(params[:id])
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

  def update
    @admin = Admin.find(current_admin.id)
    edit_exam = @admin.exams.find(params[:id])
    if edit_exam.update_attributes(params[:exam])
      redirect_to admin_exams_path
    else
      render 'edit'
    end
  end

  def destroy
    exam = Exam.find(params[:id])
    exam.destroy
    redirect_to admin_exams_path
  end
end
