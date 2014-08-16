module Capybara
  module Helpers
    def login_with(user)
      # Devise::SessionsController.layout 'single_page'
      # Devise::ConfirmationsController.layout 'single_page'
      user.password = 'qwerty123'
      user.password_confirmation = 'qwerty123'
      user.save!

      visit new_user_session_path
      fill_in :user_email, with: user.email
      fill_in :user_password, with: 'qwerty123'
      find('.form-authorization').click_button 'Войти'
    end
  end
end
