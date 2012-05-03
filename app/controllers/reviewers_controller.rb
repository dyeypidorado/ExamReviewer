class ReviewersController < ApplicationController

  def index
    user = User.find(params[:user_id])
    @reviewers = user.reviewers.all
  end
  
  def new
    user = User.find(params[:user_id])
    exam = Exam.find(params[:exam_id]) 
    @reviewer = user.reviewers.new(:exam_id => exam.id )
    
    questions = exam.questions.all
    
    questions.each do |question|
      @reviewer.items.build(:question_id => question.id)
    end
  end
  
  def edit
    user = User.find(params[:user_id])
    exam = Exam.find(params[:exam_id]) 
    @reviewer = user.reviewers.new(params[:id])  
  end
  
  def create
    user = User.find(params[:user_id]) 
    items = params[:reviewer][:items_attributes]
    
    items_answered = 0
    items_corrected = 0
    
    items.each do |item|
      if item[1]['choice_id'] != nil
        items_answered += 1
        choice = Choice.find(item[1]['choice_id'])
        if choice.isCorrect?
          items_corrected += 1
        end
      end
    end
    
    reviewer = user.reviewers.new(:exam_id => params[:exam_id], :items_answered => items_answered, :correct_items => items_corrected )
    
    if reviewer.save
      redirect_to user_reviewers_path(user.id)
    end 
  end
  
  def check_answer
    render :text => Choice.is_correct?(params[:choice])
  end
  
end
