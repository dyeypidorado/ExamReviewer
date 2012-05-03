class ExamsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @exams = Exam.all
    @user = User.find(current_user.id)
  end
end
