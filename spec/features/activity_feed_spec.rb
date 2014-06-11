require 'spec_helper'

feature 'Activity feed', public_activity: true, js: true, callbacks: true do
  feature do
    given!(:user1) { create(:user) }
    given!(:user2) { create(:user) }

    background do
      login_with(user2)
    end

    feature 'I see user uploaded picture' do
      background do
        create_list(:picture, 2, user: user1)
        user2.follow(user1)
      end

      scenario do
        visit activities_path
        expect(current_url).to match(/#{activities_path}/)
        expect(page).to have_content("#{user1.name} загрузил 2 картинки")
      end
    end

    feature 'I see someone followed me' do
      background do
        user1.follow(user2)
      end

      scenario do
        visit activities_path
        expect(page).to have_content("#{user1.name} подписался на ваши обновления ")
      end
    end

    feature 'I see someone commented my picture' do
      background do
        create(:picture, user: user2)
        user1.comments.create!(commentable: user2.pictures.first, text: "wow")
      end

      scenario do
        visit activities_path
        expect(page).to have_content("#{user1.name} оставил комментарий \"wow\" на изображение")
      end
    end

    feature 'I see someone liked my picture' do
      background do
        create(:picture, user: user2)
        user1.likes.create!(likeable: user2.pictures.first)
      end

      scenario do
        visit activities_path
        expect(page).to have_content("#{user1.name} оценил ваше изображение")
      end
    end

    feature 'I see someone liked my comment' do
      background do
        create(:picture, user: user2)
        comment = create(:comment, user: user2, commentable: user2.pictures.first)
        user1.likes.create!(likeable: comment)
      end

      scenario do
        visit activities_path
        expect(page).to have_content("#{user1.name} оценил ваш комментарий")
      end
    end
  end
end
