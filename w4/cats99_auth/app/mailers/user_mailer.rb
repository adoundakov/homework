class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = 'http://99cats.com/'
    mail(from: "Alex Doundakov <somebody@example.com>",
         to: "someone@appacademy.io",
         subject: 'Welcome! 99 Cats await!')
  end
end
