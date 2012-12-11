#encoding: utf-8
module UsersHelper

  def td_value(user)
    if get_user_school_relation(user)
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
