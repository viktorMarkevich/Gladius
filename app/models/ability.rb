class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role? :manager
      #can :manage, School.where(:id => user.school_id)
      #can :manage, User.where(:school_id => user.school_id)
      can :manage, User
    end

    if user.role? :moderator
      #can :manage, School.where(:id => user.school_id)
      can :manage, User.where(:role => "pupil")
      cannot :manage, User.where(:role => ["manager", "moderator"])
      can :do_this, :for_moderator
    end

    if user.role? :pupil
      #can :read, School
      cannot :manage, User
    end

    can :manage, :all if user.role == "admin"
  end
end
