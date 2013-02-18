Feature: Фоловинг пользователей
Для того, чтобы следить за обновлениями интересных мне людей.
Как пользователь.
Я хочу иметь возможность зафоловить другого пользователя.

  Scenario: Фоловинг другого пользователя
    Given I am logged in
    When I start following another user
    Then I should see "Вы успешно подписались на обновления пользователя"

  Scenario: Анфоловинг другого пользователя
    Given I am logged in
    Given I follow another user
    When I stop following another user
    Then I should see "Вы успешно отписались от обновлений п"