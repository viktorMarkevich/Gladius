class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.role? :pupil
      can :update,  User, :id => user.id
    end

    if user.role? :moderator
      can :manage, User, :school_id => user.school_id, :role => "pupil"
      can :update, School, :id => user.school_id
      cannot :manage,  User, :role => "manager"
    end

    if user.role? :manager
      can :manage, User, :school_id => user.school_id, :role => "moderator"
      can :update, User, :id => user.id, :role => "manager"
      can :destroy, School, :id => user.school_id
      can :create, School

    end

    #if user.role? :fighter
    #  #cannot :update, User.where( :role => ["pupil", "moderator", "manager"])
    #end

    #can :manage, :all if user.role == "admin"
  end
end
