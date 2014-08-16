SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    def wrap(name, icon, arrow = false)
      result = "<i class='menu-#{icon}'></i>"
      result << "<div class='nav-name'>#{name}</div>"
      # result = "#{result}<i class=\"icon-menu-arrow\"></i>" if arrow
      result
    end

    primary.item :settings, wrap('Настройки', :settings) do |settings|
      settings.item :profile, 'Личные данные', edit_user_path(current_user)
      settings.item :password, 'Пароль', edit_user_passwords_path
      settings.item :notifications, 'Уведомления', notification_settings_path
    end

    primary.item :portfolio, wrap('Портфолио', :portfolio) do |portfolio|
      portfolio.item :projects, 'Проекты', edit_user_path(current_user)
      portfolio.item :albums, 'Альбомы', notification_settings_path
    end
  end
end
