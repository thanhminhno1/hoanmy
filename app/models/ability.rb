# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all # Admins can manage everything
    else
      can :read, PartiantTracking # Normal users can only read PartiantTracking
      can :create, PartiantTracking
      can :update, PartiantTracking, user_id: user.id # Can only update their own records
    end
  end
end
