#encoding: utf-8
Given(/^I am new user$/) do
  check_unregistered_user
end

When(/^I visit promotion page$/) do
  visit promotions_path
end

When(/^I submit promotion form$/) do
  fill_in('promotion_email', with: 'promouser@example.com')
  click_button('Отправить')
end

Then(/^I should be subscribed to promo news$/) do

end

Given(/^I am existing promo subscriber$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see that I already subscribed$/) do
  pending # express the regexp above with the code you wish you had
end
