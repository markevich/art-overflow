Given(/^I am not following another user$/) do
  check_that_not_following(another_user)
end

When(/^I visit another user page$/) do
  visit user_path(another_user)
end

When(/^I click follow button$/) do
  click_follow_button
end

Then(/^I should see that i am following that user$/) do
  expect(page).to have_content I18n.t('user.start_following', name: another_user.nickname)
end

Given(/^I follow another user$/) do
  follow(another_user)
end

When(/^I click unfollow button$/) do
  click_unfollow_button
end

Then(/^I should see that i am stop following that user$/) do
  expect(page).to have_content I18n.t('user.stop_following', name: another_user.nickname)
end
