#encoding: utf-8
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
  fill_in('subscriber_email', with: subscriber_email)
  click_button('Отправить')
end

Then(/^I should see that i successfully subscribed$/) do
  #TODO: check for flash message where it be ready.
  expect(Subscriber.exists?(email: @subscriber_email)).to be_true
end

Then(/^I should see that I already subscribed$/) do
  expect(page).to have_content 'Emailhas already been taken'
end
