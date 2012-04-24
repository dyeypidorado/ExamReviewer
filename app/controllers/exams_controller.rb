class ExamsController < ApplicationController
  def index
    @exams = Exam.all
    @user = User.find(params[:user_id])
  end  
end
