class UserMailer < ApplicationMailer
  default from: "admin@musicland.com"

  def activation_email(user)
    @user = user
    @url = "#{activate_url}?activation_token=#{user.activation_token}"
    mail(to: user.email, subject: 'Welcome to MusicLand')
  end
end
