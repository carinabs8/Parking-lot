class Ability
  include CanCan::Ability

  def initialize(user)
    user||= User.new(:role => 0)
    if user.role? 1
      can :manage, :all
    else
      can :read, Map
    end
  end
end