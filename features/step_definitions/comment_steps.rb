Given(/^picture$/) do
  create_picture
end

When(/^visit picture$/) do
  visit picture_path(picture)
end

Then(/^I leave important comment$/) do
  fill_in('comment_raw_content', with: "Not perfect, but still fun.")
  click_button 'Create Comment'
end

