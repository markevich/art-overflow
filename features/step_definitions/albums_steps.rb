When(/^I visit My profile page$/) do
  visit user_pictures_path(current_user)
  expect(page).to have_text('Загрузить')
end

When(/^I click Albums link$/) do
  click_link('Альбомы')
end

Then(/^I should see new album button$/) do
  expect(page).to have_link 'Создать альбом'
end

When(/^I click new album button$/) do
  click_link('Создать альбом')
end

When(/^I fill in new album fields$/) do
  fill_in 'Имя', with: 'Новый супер альбом'
  fill_in 'Описание', with: 'Супер описание'
end

Then(/^I should see album validation error$/) do
  expect(page).to have_content('не может быть пустым')
end

When(/^I click create album button$/) do
  click_button 'Создать альбом'
end

Then(/^I should see that new album is created$/) do
  expect(page).to have_content 'Альбом успешно создан'
end

Then(/^I see my new album in list$/) do
  expect(page).to have_content('Новый супер альбом')
end

Then(/^I click on my album$/) do
  click_link('Новый супер альбом')
end

Then(/^I click on edit album$/) do
  click_link('Редактировать альбом')
end

Then(/^I click on delete album$/) do
  click_link('Удалить альбом')
end

Then(/^I should see that new album is deleted$/) do
  expect(page).to have_content 'Альбом успешно удален'
end
