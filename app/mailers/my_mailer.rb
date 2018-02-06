class MyMailer < ActionMailer::Base
  default from: 'myflix@support.com'

  def success_registration(user)
    @user = user
    mail(to: @user.email, subject: "Successful registration for myflix!")
  end
end