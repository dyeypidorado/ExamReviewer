class ReviewersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @reviewers = @user.reviewers.all
  end

  def new
    user = User.find(current_user.id)
    exam = Exam.find(params[:exam_id])
    
    reviewer = user.reviewers.new()
    reviewer.exam_id = exam.id
    reviewer.save
    
    redirect_to user_exam_reviewer_path(user.id, exam.id, reviewer.id)
  end
  
  def show
    @user = User.find(current_user.id)
    @exam = Exam.find(params[:exam_id])
    @questions = @exam.questions.all    
    @reviewer = @user.reviewers.find(params[:id])
  end

  def check_answer
    reviewer = Reviewer.find(params[:reviewer_id])
    item = reviewer.items.build()
    item.choice_id = params[:choice_id]
    item.question_id = params[:question_id]
                             
    if item.save
      item.check_answer
      render :text => Choice.is_correct?(params[:choice_id])
    end
  end

end
