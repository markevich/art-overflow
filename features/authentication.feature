Feature: Авторизация
  Для того чтобы использовать весь функционал сайта.
  Как существующий пользователь.
  Я хочу авторизоваться.

  Scenario: Авторизация существующего пользователя.
    Given I am existing user
    When I visit "/"
    And click link "Sign in"
    And I fill "example@example.com" in field "user_email"
    And I fill "please" in field "user_password"
    And click button "Sign in"
    Then page should be "/"
    And I should see "Signed in successfully"