Feature: Following
  Scenario: Follow another user
    Given I am logged in
    Given Another user
    Given I am not following another user
    When I visit another user page
    When I click follow button
    Then I should see that i am following that user

  Scenario: Stop following another user
    Given I am logged in
    Given Another user
    Given I follow another user
    When I visit another user page
    When I click unfollow button
    Then I should see that i am stop following that user

