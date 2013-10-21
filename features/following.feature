@javascript
Feature: Following
  Scenario: Follow and unfollow another user
    Given I am logged in
    Given Another user
    Given I am not following another user
    When I visit another user page
    Then I should see that i am not following that user
    When I click follow button
    Then I should see that i am following that user
    When I click unfollow button
    Then I should see that i am not following that user
