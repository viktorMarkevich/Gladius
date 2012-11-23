class UserMailer < ActionMailer::Base
  default :from => "viktor.markevich@faceit.com.ua"

  def notification_you_have_added(object, password)
    @user = object
    @password = password
    mail(:to => @user.email, :subject => "You will be added into Gladius site")
  end
end
