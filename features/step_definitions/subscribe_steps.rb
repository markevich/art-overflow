Given(/^I am new subscriber/) do
  check_unregistered_subscriber
end

Given(/^I am existing subscriber/) do
  create_subscriber
end

When(/^I visit subscribe page$/) do
  visit_subscribe_page
end

When(/^I submit subscribe form$/) do
  fill_subscriber_form
  click_button(I18n.t(:submit))
end

Then(/^I should see that i successfully subscribed$/) do
  expect(page).to have_content I18n.t('subscriber.subscribed')
end

Then(/^I should see that I already subscribed$/) do
  expect(page).to have_content 'E-mail уже существует'
end
