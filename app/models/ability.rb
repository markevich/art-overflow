class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    cannot :manage, :all

    user_rules
    picture_rules
    album_rules
    comment_rules
  end


  def user_rules
    can [:read, :follow, :stop_following], User
    can [:update], User, id: @user.id
  end

  def picture_rules
    can [:read, :like, :unlike], Picture
    can [:create, :update, :destroy], Picture, user_id: @user.id
  end

  def album_rules
    can :read, Album
    can [:create, :update, :destroy], Album, user_id: @user.id
  end

  def comment_rules
    can [:read, :like, :unlike, :create], Comment
    can [:destroy], Comment, user_id: @user.id
  end
end
