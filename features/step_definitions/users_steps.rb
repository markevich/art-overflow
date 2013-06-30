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

Then(/^I should see confirmation email sended$/) do
   expect(page).to have_content 'Письмо со ссылкой для подтверждения было отправлено на ваш e-mail.'
end

Then(/^I confirm my account through email$/) do
  confirmation_mail.to.should == [user_email]
  confirmation_mail.body.encoded.should match("confirmation_token")
  visit confirmation_link
end

Then(/^my account confirmed$/) do
  User.find_by_email(user_email).should be_confirmed
end
