Given(/^picture of another user$/) do
  create_picture(another_user)
end

When(/^I visit another user picture page$/) do
  visit picture_path(picture)
end

Then(/^I should be on another user picture page$/) do
  expect(current_path).to eq picture_path(picture)
end

Then(/^I write comment$/) do
  write_comment()
end

Then(/^I see my comment appeared/) do
  expect(page).to have_content(comment_text)
end

Given(/^Another user write comment$/) do
  @another_comment = create(:comment, commentable_id: picture.id, commentable_type: 'Picture', user: another_user)
end

Then(/^I see his comment$/) do
  expect(page).to have_content(@another_comment.text)
end

Then(/^I like his comment$/) do
  like_comment
end

Then(/^I unlike his comment$/) do
  unlike_comment
end

Then(/^I see that I liked his comment$/) do
  expect(page).to have_link(like_comment_link)
end

Then(/^I see I can like his comment$/) do
  expect(page).to have_link(like_comment_link)
end

Then(/^I delete my comment$/) do
  click_link I18n.t('comment.destroy')
end

Then(/^I don't see my comment$/) do
  expect(page).to_not have_content(comment_text)
end
