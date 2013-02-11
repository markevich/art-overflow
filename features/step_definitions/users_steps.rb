Given /^I am existing user$/ do
  @user = create(:user)
end

Given /^I am logged in$/ do
  @user = create(:user)
  visit '/users/sign_in'
  fill_in "user_email", :with => 'example@example.com'
  fill_in "user_password", :with => 'please'
  click_button "Sign in"
end

When /^I visit another user's page$/ do
  visit user_path(@another_user)
end

Given /^Another user$/ do
  @another_user = create(:user, :another)
end
Given /^I follow another user$/ do
  @user.follow(@another_user)
end