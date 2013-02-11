Feature: Фоловинг пользователей
Для того, чтобы следить за обновлениями интересных мне людей.
Как пользователь.
Я хочу иметь возможность зафоловить другого пользователя.

  Scenario: Фоловинг другого пользователя
    Given I am logged in
    When I visit another user's page
    When I click button "Follow"
    Then I should see "Вы успешно подписались на обновления пользователя Василий"

  Scenario: Анфоловинг другого пользователя
    Given I am logged in
    When I visit another user's page
    When I click button "Unfollow"
    Then I should see "Вы успешно отписались от обновлений пользователя Василий"