class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @admin = Admin.find(current_admin.id)
    @exam = Exam.find(params[:exam_id])
    @questions = @exam.questions.all
  end

  def show
    @admin = Admin.find(current_admin.id)
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:id])
    @choices = @question.choices.all
  end

  def new
    @admin = Admin.find(current_admin.id)
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.new
    3.times { @question.choices.build }
  end

  def edit
    @admin = Admin.find(current_admin.id)
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:id])
    @choices = @question.choices.all
  end

  def create
    exam = Exam.find(params[:exam_id])
    question = exam.questions.new(params[:question])
    if question.save
      redirect_to admin_exam_question_path(exam.id, question.id)
    else
      render 'new'
    end
  end

  def update
    exam = Exam.find(params[:exam_id])
    question = exam.questions.find(params[:id])

    if question.update_attributes(params[:question])
      redirect_to admin_exam_question_path(exam.id, question.id)
    else
      render 'edit'
    end
  end

  def destroy
    exam = Exam.find(params[:exam_id])
    question = exam.questions.find(params[:id])
    if question.destroy
    end
    redirect_to admin_exam_questions_path(exam.id)
  end
end
