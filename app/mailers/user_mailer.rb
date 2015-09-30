class UserMailer < ActionMailer::Base
  default from: "fantasysnl@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Fantasy SNL!')
  end

  def drafting_turn_email(user, league)
    @user = user
    @league = league
    mail(to: @user.email, subject: "It's your turn to draft!")
  end
end
