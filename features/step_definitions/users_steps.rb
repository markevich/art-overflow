When /^I visit another user's page$/ do
  step('Another user exist')
  visit user_path(200)
end


Given /^Another user exist$/ do
  create(:another_user)
end