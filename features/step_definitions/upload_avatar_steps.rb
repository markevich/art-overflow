When(/^I visit edit profile page$/) do
  visit edit_user_path(current_user)
end

When(/^I click change avatar button$/) do
  click_link 'Сменить аватар'
end

When(/^I select my new avatar picture$/) do
  attach_file(:user_avatar, File.join(Rails.root, '/spec/files/avatar.jpg'))
end

When(/^I click confirm button$/) do
  click_button 'Сохранить'
end

Then(/^I should see that my profile updated$/) do
  expect(page).to have_content 'Пользователь успешно обновлен(а)'
end
