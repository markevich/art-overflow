Feature: Загрузка картинки
  Для того чтобы другие пользователи могли оценить мой рисунок.
  Как пользователь.
  Я хочу загрузить рисунок.
  Background:
    Given drawing category "Рисунки карандашом"

    
  Scenario: Загрузка с локального компьютера 
    Given I am logged in
    When I visit "/"
    When click link "Добавить рисунок"
    When I fill "Мой крутой рисунок" in field "drawing_name"
    When I select "Рисунки карандашом" in "drawing_drawing_category_id"
    When I fill "рисунок, карандаши" in field "drawing_tags"
    When I attach the file "features/resources/drawing.jpg" to "drawing_path"
    When I click button "Сохранить"
    Then I should see "Рисунок успешно загружен"

