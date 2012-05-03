class ReviewersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @reviewers = @user.reviewers.all
  end

  def new
    @user = User.find(current_user.id)
    exam = Exam.find(params[:exam_id])
    @reviewer = @user.reviewers.new(:exam_id => exam.id )

    questions = exam.questions.all

    questions.each do |question|
      @reviewer.items.build(:question_id => question.id)
    end
  end

  def create
    @user = User.find(current_user.id)
    reviewer = @user.reviewers.new(params[:reviewer])

    if reviewer.save
      reviewer.check_scores
      redirect_to user_reviewers_path(@user.id)
    end
  end

  def check_answer
    render :text => Choice.is_correct?(params[:choice])
  end

end
