#encoding: utf-8
module UsersHelper

  def td_value(user)
    if user.school_relation
      link_to "Редактировать", edit_user_path(user)
    else
      if (user == current_user)
        link_to "Редактировать", edit_user_path(user)
      else
        link_to "Пригласить", "#"
      end
    end
  end
end
