Feature: Авторизация
  Для того чтобы использовать весь функционал сайта.
  Как существующий пользователь.
  Я хочу авторизоваться.

  Scenario: Авторизация существующего пользователя.
    Given I am existing user
    When I visit authentication page
    And fill my login credentials
    Then I should be authorized
