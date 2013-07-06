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
  @pictures_count = all('.image-block').count
end

When(/^I click show more button$/) do
  show_more_link.click
end

Then(/^I should not see show more button$/)do
  expect(show_more_link).to be_nil
end

Then(/^new pictures should appear on page$/) do
  page.save_screenshot('/Users/markevich/Desktop/img.png')
  new_pictures_count = all('.image-block').count
  expect(new_pictures_count).to be > @pictures_count
end

When(/^I scroll to bottom of page$/) do
  @pictures_count = all('.image-block').count
  page.execute_script "window.scrollBy(0,10000)"
end

