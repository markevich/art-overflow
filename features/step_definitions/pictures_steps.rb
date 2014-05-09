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

Then(/^new pictures should appear on page$/) do
  @page += 1
  expect(page).to have_css('.image-block', count: PicturesController::PAGE_SIZE * @page)
end

When(/^I scroll to next page$/) do
  scroll_to_next_page
end

When(/^I scroll to bottom of screen$/) do
  scroll_to_bottom_of_screen
end

When(/^I like his picture$/) do
  like_picture
end

Then(/^I see that I liked his picture$/) do
  expect(unlike_picture_button).to_not be_nil
end

When(/^I unlike his picture$/) do
  unlike_picture
end

Then(/^I see I can like his picture$/) do
  expect(like_picture_button).to_not be_nil
end

Then(/^I should see "(.*?)" in current path$/) do |part|
  expect(page.current_url).to match part
end

Then(/^I see (\d+) likes? on picture$/) do |count|
  expect(picture_likes_count).to eq count
end

When(/^I reload page$/) do
  visit current_path
end

Given(/^my picture$/) do
  create_picture(current_user)
end

When(/^I visit my picture page$/) do
  visit picture_path(current_user.pictures.first)
end

When(/^I click pictures that I liked$/) do
  click_link 'Понравившиеся'
end

Then(/^I click edit picture$/) do
  click_link 'Редактировать'
end

Then(/^I change picture name$/) do
  fill_in 'Имя', with: 'Новое имя'
end

Then(/^I change picture description$/) do
  fill_in 'Описание', with: 'Новое описание'
end

Then(/^I click save$/) do
  click_button 'Сохранить изменения'
end

Then(/^I should see that my picture is edited$/) do
  expect(page).to have_content 'Картинка успешно обновлена'
end
