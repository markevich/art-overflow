Given(/^I am logged in$/) do
  user_logged_in
end

Given(/^Another user$/) do
  create_another_user
end

Given(/^I am unregistered user$/) do
  true
end

When(/^I visit registration page$/) do
  visit_registration_page
end

When(/^I submit registration form$/) do
  fill_registration_form
  click_button('Sign up')
end

Then(/^I should see that i successfully registered$/) do
   expect(page).to have_content 'Письмо со ссылкой для подтверждения было отправлено на ваш e-mail.'
end
