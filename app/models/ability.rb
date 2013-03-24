class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Article
    can :read, Page
    can :read, Material

    if user.user?
      can :read, Student
    end

    if user.tutor?
      can :manage, Student
    end

    if user.admin?
      can :manage, :all
      can :access, :ckeditor   # needed to access Ckeditor filebrowser
      # Performed checks for actions:
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile
    end

  end
end
