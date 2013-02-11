

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

Then /^I should be on my picture page$/ do
  current_path.should match /drawings\/\d+/
end
