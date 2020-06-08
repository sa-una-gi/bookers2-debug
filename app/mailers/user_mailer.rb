class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def user_welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: '私の素敵なサイトへようこそ')
  end
end
