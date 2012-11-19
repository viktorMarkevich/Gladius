class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role? :manager
      #can :manage, School.where(:id => user.school_id)
      #can :manage, User.where(:school_id => user.school_id)
      can :manage, User
    end

    if user.role? :moderator
      can :create, School
      can :destroy, User.where(:role => "pupil")
      can :create, User
      can :update, User.where(:role => "pupil")
      cannot :update, User.where(:role => ["manager", "moderator"])
      can :do_this, :for_moderator
      cannot :create, :for_moderator
    end

    if user.role? :pupil
      can :read, User
    end

    can :manage, :all if user.role == "admin"
  end
end
