class UserMailer < ActionMailer::Base
  default from: "fantasysnl@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Fantasy SNL!')
  end
end
