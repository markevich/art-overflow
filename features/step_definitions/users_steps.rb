Given(/^I am existing user$/) do
  #current_user = create(:user)
end

Given(/^I am logged in$/) do
  i_am_logged_in
end

When(/^I start following another user$/) do
  visit user_path(another_user)
  click_button "Follow"
end

Given(/^I follow another user$/) do
  current_user.follow(another_user)
end

When(/^I stop following another user$/) do
  visit user_path(another_user)
  click_button "Unfollow"
end
Then /^I should follow this user$/ do
  current_user.following?(another_user).should be_true
end
Then /^I should not follow this user$/ do
  current_user.following?(another_user).should be_false
end