Feature: Загрузка картинки
  Для того чтобы другие пользователи могли оценить мой рисунок.
  Как пользователь.
  Я хочу иметь возможность добавить собственные рисунки.
  
  Background:
    Given drawing category "Рисунки карандашом"

  @javascript
  Scenario: Загрузка с локального компьютера 
    Given I am logged in
    When I visit "/"
    When I click link "Добавить рисунок"
    When I attach the file "features/resources/drawing.jpg" to "Изображение с компьютера"
    When I fill "Мой крутой рисунок" in field "Имя"
    When I select "Рисунки карандашом" in "Категория"
    When I fill "рисунок, карандаши" in field "Тэги"
    When I click button "Сохранить"
    Then I should be on my picture page

  @wip @javascript
  Scenario: Загрузка с ссылки в интернете
    Given I am logged in
    Given picture "http://example.com/test.jpg" exist
    When I visit "/"
    When I click link "Добавить рисунок"
    When I fill "http://example.com/test.jpg" in field "Изображение с интернета"
    When I fill "Мой крутой рисунок" in field "Имя"
    When I select "Рисунки карандашом" in "Категория"
    When I fill "рисунок, карандаши" in field "Тэги"
    When I click button "Сохранить"
    Then I should be on my picture page

