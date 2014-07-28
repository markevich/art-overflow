require 'spec_helper'

feature 'Picture upload', js: true do

  given!(:album) { create(:album, user: user) }
  given(:user) { create(:user) }

  background do
    Category::KEYS.each do |name|
      create(:category, name: name)
    end
    login_with(user)
  end

  scenario do
    visit root_path
    click_link 'Загрузить'

    attach_file(:picture_path, File.join(Rails.root, '/spec/files/picture.jpg'))

    fill_in :picture_name, with: 'Picture name'
    fill_in :picture_description, with: 'Picture description'
    find('label', text: 'Анимация').click
    find('label', text: 'Транспорт').click
    select album.name, from: :picture_album_id

    click_button 'Отправить'

    expect(page).to have_content 'Картинка успешно создана'
    expect(page).to have_content 'Picture name'
    expect(page).to have_content 'Picture description'
    expect(page).to have_content album.name
    expect(page).to have_content 'Анимация'
    expect(page).to have_content 'Транспорт'
  end
end
