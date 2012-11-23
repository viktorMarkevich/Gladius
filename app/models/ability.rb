class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.role? :pupil
      can :update,  User, :id => user.id
    end

    if user.role? :moderator
      if user.school_id != 0
        can :update, School, :id => user.school_id
        can :manage, User, :school_id => user.school_id, :role => "pupil"
        can :manage, User, :school_id => nil, :role => "fighter"
      else
        cannot :destroy, User, :school_id => user.school_id, :role => "pupil"
        cannot :create, User, :school_id => user.school_id, :role => "pupil"
        cannot :update, School, :id => user.school_id
      end
      cannot :manage,  User, :role => "manager"
      cannot :destroy, User, :school_id => nil, :role => "fighter"
    end

    if user.role? :manager
      if user.school_id != 0
        can :manage, User, :school_id => user.school_id, :role => ["moderator", "manager"]
        can :destroy, School, :id => user.school_id
      else
        cannot :destroy, User, :school_id => user.school_id, :role => "moderator"
        cannot :create, User
      end
      can :update, User, :id => user.id, :role => "manager"
      can :create, School

    end

    if user.role? :fighter
      cannot :manage, User, :role => ["pupil", "moderator", "manager", "admin"]
      cannot :create, School
      cannot :create, User
    end

    can :manage, :all if user.role == "admin"
  end
end
