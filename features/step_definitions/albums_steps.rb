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
  expect(page).to have_content 'Альбом успешно создан(а)'
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
  expect(page).to have_content 'Альбом успешно удален(а)'
end

Given(/^my album$/) do
  @album = create(:album, name: 'Cool album', user: current_user)
end

When(/^I go to my album$/) do
  within '.name' do
    click_link(@album.name)
  end
end

When(/^I click edit button$/) do
  click_link 'Редактировать альбом'
end

When(/^I click change album avatar button$/) do
  click_link 'Изменить обложку'
end

When(/^I select my new album avatar picture$/) do
  attach_file(:album_avatar, File.join(Rails.root, '/spec/files/avatar.jpg'))
end

When(/^I click confirm album avatar button$/) do
  within '.modal' do
    click_button 'Сохранить'
  end
end

Then(/^I should see that my album updated$/) do
  expect(page).to have_content 'Альбом успешно обнолен'
end
