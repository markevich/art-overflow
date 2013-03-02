Feature: 'Комментарии'
  Для того, чтобы высказать свое мнение, уточнить вопрос, поспорить, либо создать дискусию.
  Как пользователь.
  Я хочу оставить комментарий.

  Scenario: 'Комментарий к рисунку.'
    Given I am logged in
    Given I am on some drawing page
    When I write comment for drawing and submit it
    Then I should see my comment
