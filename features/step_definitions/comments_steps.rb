#encoding: utf-8
Given(/^I am on some drawing page$/) do
  visit(drawing_path(drawing))
end

When(/^I write comment for drawing and submit it$/) do
  fill_in 'Добавить комментарий', with: 'Мой особый комментарий'
  click_button 'Добавить комментарий'
end

Then(/^I should see my new comment$/) do
  within('#comments-area') do
    page.should have_content 'Мой особый комментарий'
    page.should have_content current_user.name
  end
end
