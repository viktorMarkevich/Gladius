#encoding: utf-8
module UsersHelper

  def td_value(user)
    if user.school_relation
      if (can? :update, user) || (user == current_user)
        link_to "Редактировать", edit_user_path(user)
      else
        link_to "Пригласить", "#"
      end
    else
      if (user == current_user)
        link_to "Редактировать", edit_user_path(user)
      else
        link_to "Пригласить", "#"
      end
    end
  end
end
