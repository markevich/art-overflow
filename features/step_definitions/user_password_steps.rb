When(/^I visit my profile settings path$/) do
  visit edit_user_path(current_user)
end

When(/^I click change password link$/) do
  click_link 'Пароль'
end

When(/^I fill in my new password information$/) do
  fill_in 'Текущий пароль', with: user_password
  fill_in 'Пароль', with: 'new_password'
  fill_in 'Подтверждение пароля', with: 'new_password'

  click_button 'Изменить пароль'
end

Then(/^I should see that password updated$/) do
  expect(page).to have_content('Пароль успешно изменен')
end
