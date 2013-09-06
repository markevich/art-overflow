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

  def click_follow_button
    click_button I18n.t('follow')
  end
  
  def click_unfollow_button
    click_button I18n.t('unfollow')
  end
end

World(FollowingWorld)
