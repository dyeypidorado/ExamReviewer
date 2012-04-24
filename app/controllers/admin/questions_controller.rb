class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @exam = Exam.find(params[:exam_id])
    @questions = @exam.questions.all
  end
  
  def show
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:id])
    @choices = @question.choices.all
  end
  
  def new
    exam = Exam.find(params[:exam_id])
    @question = exam.questions.new
    3.times { @question.choices.build }
  end
  
  def edit
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:id])
    @choices = @question.choices.all
  end
  
  def create
    exam = Exam.find(params[:exam_id])
    question = exam.questions.new(:question => params[:question][:question])
    choices = params[:question][:choices_attributes]
    if question.save
      choices.each do |choice|
        question.choices.create(:choice => choice[1]['choice'], :isCorrect => choice[1]['isCorrect'])
      end
      redirect_to admin_exam_question_path(exam.id, question.id)
    else
      render 'new'
    end
  end
  
  def update
    exam = Exam.find(params[:exam_id])
    question = exam.questions.find(params[:id])
    choices = params[:question][:choices_attributes]
    if question.update_attributes(:question => params[:question][:question])
      choices.each do |choice| 
        choice_to_edit = question.choices.find(choice[1]['id'])
        choice_to_edit.update_attributes(:choice => choice[1]['choice'], :isCorrect => choice[1]['isCorrect'])
      end
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
