class ReviewersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @reviewers = user.reviewers.all
  end
  
  def new
    @user = User.find(params[:user_id])
    @exam = Exam.find(params[:exam_id]) 
    @reviewer = @user.reviewers.new(:exam_id => @exam.id )
  end
  
  def create
    user = User.find(params[:user_id]) 
    reviewer = user.reviewers.new(:exam_id => params[:exam_id])
    if reviewer.save
      redirect_to user_reviewers_path
    else
      render 'new'
    end 
  end
  
end
