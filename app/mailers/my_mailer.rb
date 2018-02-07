class MyMailer < ActionMailer::Base
  default from: 'myflix@support.com'

  def success_registration(user)
    @user = user
    mail(to: @user.email, subject: "Successful registration for myflix!")
  end

  def forget_password(user)
    @user = user
    mail(to: @user.email, subject: "Please reset your password")
  end
end