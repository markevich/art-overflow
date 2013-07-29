Transform(/^(-?\d+)$/) do |number|
  number.to_i
end

Given(/^that many pictures exists$/) do
  count = PicturesController::PAGE_SIZE * 3
  create_many_pictures(count)
end

Given(/^that few pictures exists$/) do
  count = PicturesController::PAGE_SIZE / 2
  create_many_pictures(count)
end

Given(/^I am on pictures page$/) do
  visit pictures_path
end

Given(/^I remember the number of pictures$/) do
  @page = 1
end

When(/^I click show more button$/) do
  show_more_link.click
end

Then(/^I should not see show more button$/)do
  expect(show_more_link).to be_nil
end

Then(/^new pictures should appear on page$/) do
  @page += 1
  expect(page).to have_css('.image-block', count: PicturesController::PAGE_SIZE * @page)
end

When(/^I scroll to bottom of page$/) do
  page.execute_script "$(window).data('scrolling', false)"
  page.execute_script "window.scrollBy(0,10000)"
end

When(/^I like his picture$/) do
  click_button picture_like_button
end

Then(/^I see that I liked his picture$/) do
  expect(page).to have_button(picture_unlike_button)
end

When(/^I unlike his picture$/) do
  click_button picture_unlike_button
end

Then(/^I see I can like his picture$/) do
  expect(page).to have_button(picture_like_button)
end
