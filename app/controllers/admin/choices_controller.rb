class Admin::ChoicesController < ApplicationController
  def new
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:question_id])
    @choices = @question.choices.new
  end
  
  def edit
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:question_id])
    @choices = @question.choices.find(params[:id])
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
end
