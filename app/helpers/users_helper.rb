#encoding: utf-8
module UsersHelper
  def get_sex
    @user.sex ? 'Женский' : 'Мужской'
  end
end
