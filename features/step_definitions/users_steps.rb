Given(/^I am logged in$/) do
  user_logged_in
end

Given(/^Another user$/) do
  create_another_user
end

Given(/^I am unregistered user$/) do
  expect(current_user).to be_nil
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

Then(/^mail should be sended to me$/) do
  confirmation_mail.to.should == [user_email]
end

Then(/^mail should contain confirmation link$/) do
  confirmation_mail.body.encoded.should match("confirmation_token")
end

When(/^I click confirmation link$/) do
  visit confirmation_link
end

Then(/^my account confirmed$/) do
  User.find_by_email(user_email).should be_confirmed
end
