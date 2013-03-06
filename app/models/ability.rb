class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :read, Article

    if user.admin?
      can :manage, :all
      can :access, :ckeditor   # needed to access Ckeditor filebrowser
      # Performed checks for actions:
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile
    end

  end
end
