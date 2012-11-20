class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role? :manager
      can :create,  School
      can :update,  School.where(:id => user.school_id)
      can :create,  User
      can :update,  User.where(:school_id => user.school_id)
      can :update,  User.where(:role => "pupil")
      can :destroy, User.where(:school_id => user.school_id, :role => ["pupil", "moderator"])
    end

    if user.role? :moderator
      #can :create, School
      #can :destroy, User.where(:role => "pupil")
      #can :create, User
      #can :update, User.where(:role => "pupil")
      #cannot :update, User.where(:role => ["manager", "moderator"])
      #can :do_this, :for_moderator
    end

    if user.role? :pupil
      can :read, User
      cannot :update, User.where(:role => ["moderator", "manager", "fighter"])
      can :update, User.where(:role => ["pupil"])

    end

    if user.role? :fighter
      cannot :update, User.where( :role => ["pupil", "moderator", "manager"])
    end

    can :manage, :all if user.role == "admin"
  end
end
