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

Given(/^another user leaves important comment$/) do
  create_another_user
  @another_comment = create(:comment, commentable_id: picture.id, commentable_type: 'Picture', user: another_user)
end

Then(/^I like his comment$/) do
  click_button I18n.t('the_comments.like')
end
