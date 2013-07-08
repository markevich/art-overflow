Given(/^picture of another user$/) do
  create_picture
end

When(/^visit picture$/) do
  visit picture_path(picture)
end

Then(/^I leave important comment$/) do
  fill_in('comment_raw_content', with: "Not perfect, but still fun.")
  click_button I18n.t('the_comments.create_comment')
end

Then(/^I see my important comment$/) do
  expect(page).to have_content("Not perfect, but still fun.")
end

Given(/^Another user leaves important comment$/) do
  @another_comment = create(:comment, commentable_id: picture.id, commentable_type: 'Picture', user: another_user)
end

Then(/^I see his comment$/) do
  expect(page).to have_content(@another_comment.content)
  expect(page).to have_button(I18n.t('the_comments.like'))
end

Then(/^I like his comment$/) do
  click_button I18n.t('the_comments.like')
end

Then(/^I see that I liked his comment$/) do
  expect(page).to have_button(I18n.t('the_comments.unlike'))
end
