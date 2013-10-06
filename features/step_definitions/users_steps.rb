Given(/^I am logged in$/) do
  user_logged_in
end

Given(/^Another user$/) do
  create_another_user
end

Given(/^I am registered user$/) do
  create_user
end

Given(/^I am unregistered user$/) do
  check_unregistered_user
end

When(/^I visit registration page$/) do
  visit_registration_page
end

When(/^I visit authentication page$/) do
  visit_authentication_page
end

When(/^I fill in my login and password$/) do
  fill_authorization_form
  click_button('Sign in')
end

Then(/^I should see that I am authorized$/) do
  expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
end

When(/^I submit registration form$/) do
  fill_registration_form
  click_button('Sign up')
end

Then(/^I should see that confirmation email sended$/) do
  expect(page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
  expect(confirmation_mail.to).to eq [user_email]
end

Then(/^I confirm my account through email$/) do
  expect(confirmation_mail_link).to_not be_nil
  visit confirmation_mail_link
end

Then(/^I should see that my account is confirmed$/) do
  User.find_by_email(user_email).should be_confirmed
  expect(page).to have_content I18n.t('devise.confirmations.confirmed')
end
