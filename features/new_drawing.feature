Feature: Загрузка картинки
  Для того чтобы другие пользователи могли оценить мой рисунок.
  Как пользователь.
  Я хочу иметь возможность добавить собственные рисунки.
  
  Background:
    Given drawing category "Рисунки карандашом"

  @javascript
  Scenario: Загрузка с локального компьютера
    Given I am logged in
    Given I am on create drawing page
    When fill all of the drawing params
    Then I should be on my newly created drawing
