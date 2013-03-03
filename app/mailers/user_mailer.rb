class UserMailer < ActionMailer::Base
  default :from => "viktor.markevich@faceit.com.ua"

  def notification_you_have_added(object, password)
    @user = object
    @password = password
    mail(:to => @user.email, :subject => "You will be added into Gladius site")
  end

  def send_a_mail_of_invitation(bidden, invited, school)
    @bidden = bidden
    @invited = invited
    @school = school
    @invite_url = url_for(:controller => 'schools', :action => 'show',
                              :id => school.id)

    mail( :to => invited.email, :subject => "You will be added into Gladius site")
  end
end
