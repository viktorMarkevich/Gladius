class Ability
  include CanCan::Ability

  def initialize(user)

    ##user ||= User.new
    #
    #if user.role == "pupil"
    #can :read, User, :all
    #end
    #
    #if user.role == "moderator"
    #  can :create, User
    #  if user.school_id != 0
    #    can [:update, :destroy], User, :school_id => user.school_id, :role => "pupil"
    #    can :update, User, :school_id => 0, :role => "fighter"
    #    can :update, School, :id => user.school_id
    #    cannot :update, User, :id => user.id
    #  else
    #    cannot :update, User
    #  end
    #end
    #
    if user.role == "manager"
      can :create, School
      can :update, User, :id => user.id
      if UserSchoolRelation.get_usr(user).present?
        can [:update, :destroy], User, :role => ["pupil", "moderator"]
        can :update, User, :role => "fighter"
        can :manage, School.where(:id => user.schools.all.map(&:id))
        can :create, User
      else
        cannot :manage, User
      end
    end
  end
end
