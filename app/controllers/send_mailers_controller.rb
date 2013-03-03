class SendMailersController < ApplicationController

  def invite
    invited = User.find(params[:invite_id])
    school_id = UserSchoolRelation.where(:user_id => current_user.id).first.school_id
    school = School.find(school_id)
    UserMailer.send_a_mail_of_invitation(current_user, invited, school).deliver
    redirect_to :back
  end

end
