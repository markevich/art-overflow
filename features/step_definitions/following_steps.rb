Given(/^I am not following another user$/) do
  check_that_not_following(another_user)
end

When(/^I visit another user page$/) do
  visit user_pictures_path(another_user)
end

When(/^I click follow button$/) do
  follow_button(another_user).click
end

Then(/^I should see that i am following that user$/) do
  expect(unfollow_button(another_user)).to_not be_nil
end

Given(/^I follow another user$/) do
  follow_button(another_user).click
end

When(/^I click unfollow button$/) do
  unfollow_button(another_user).click
end

Then(/^I should see that i am not following that user$/) do
  expect(follow_button(another_user)).to_not be_nil
end

Given(/^(\d+) users like another user comment/) do |count|
  create_many_users(count)
  @users.each do |user|
    login user
    visit picture_path(picture)
    like_comment
  end
end

Then(/^comment likes count should be (\d+)$/) do |count|
  expect(likes_for_comment_count).to be_equal count
end

When(/^(\d+) users unlike another user comment/) do |arg1|
  @users.each do |user|
    login user
    visit picture_path(picture)
    unlike_comment
  end
end
