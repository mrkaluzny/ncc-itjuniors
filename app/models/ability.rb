class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.company.present?
      can :edit, Company, id: user.company_id
    end
    can :read, :all
  end
end
