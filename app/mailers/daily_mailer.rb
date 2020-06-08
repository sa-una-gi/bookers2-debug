class DailyMailer < ApplicationMailer
  def user_daily_email(user)
    @user = user
    mail(to: @user.email, subject: "Dailyメール:#{Date.today.strftime("%Y-%m-%d")
                                             }")
  end
end
