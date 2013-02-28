#encoding: utf-8
When /^I visit "(.*?)"$/ do |path|
  visit path
end

When /^I click link "(.*?)"$/ do |link_name|
  click_link link_name
end

When /^I click button "(.*?)"$/ do |button_name|
  click_button button_name
end

When /^I fill "(.*?)" in field "(.*?)"$/ do |text, field_name|
  fill_in(field_name, with: text)
end

Then /^page should be "(.*?)"$/ do |path|
  current_path.should == path
end

Then /^I should see "(.*?)"$/ do |expected_content|
  page.should have_content expected_content
end

When /^I select "(.*?)" in "(.*?)"$/ do |item, select|
  select item, from: select
end

When /^I attach the file "(.*?)" to "(.*?)"$/ do |file_path, input|
  attach_file(input, File.expand_path(file_path))
end

Given /^I am on create drawing page$/ do
  visit new_drawing_path
end

When /^fill all of the drawing params$/ do
  attach_file('Изображение с компьютера', File.expand_path("features/resources/drawing.jpg"))
  fill_in "Имя", with: 'Мой рисунок'
  click_button "Сохранить"
end

Then /^I should be on my newly created drawing$/ do
  current_path.should match /drawings\/\d+/
end
