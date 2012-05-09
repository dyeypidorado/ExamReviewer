class UserMailer < ActionMailer::Base
  default :from => "dorado.johnphilip@gmail.com"
  
  def confirm_registration(user)
    @user = user
    mail(:to => "#{user.email}", :subject => "Registered")
  end
end


