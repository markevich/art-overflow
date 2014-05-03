module FollowingWorld
  def stop_follow(another_user)
    current_user.stop_following(another_user)
  end
  def follow(another_user)
    current_user.follow(another_user)
  end

  def check_that_not_following(another_user)
    expect(current_user).to_not be_following another_user
  end

  def follow_button(user)
    find_link I18n.t('follow'), href: follow_user_path(user)
  end

  def unfollow_button(user)
    find_link I18n.t('following'), href: stop_following_user_path(user)
  end
end

World(FollowingWorld)
