Given /^I am existing user$/ do
  create(:user)
end

When /^I visit "(.*?)"$/ do |path|
  visit path
end

When /^click link "(.*?)"$/ do |link_name|
  click_link link_name
end

When /^click button "(.*?)"$/ do |button_name|
  click_button button_name
end

When /^I fill "(.*?)" in field "(.*?)"$/ do |text, field_name|
  fill_in(field_name, with: text)
end

Then /^page should be "(.*?)"$/ do |path|
  current_path.should == path
end

Then /^page should have content "(.*?)"$/ do |expected_content|
  page.should have_content expected_content
end

