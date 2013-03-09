module UserSchoolRelationsHelper

  def user_age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month ||
        (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def get_all_email_address
    @user.user_contact_info('emails').blank? ? @user.email : "#{@user.email}, #{@user.user_contact_info('emails')}"
  end
end
