#encoding: utf-8
module UsersHelper

  def name_operation(user)
    user.school_id == current_user.school_id ? "Редактировать" : "Добавить в школу"
  end
end
