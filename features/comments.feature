@javascript
Feature: Leave comment
  Background:
    Given Another user
    Given picture of another user

  Scenario: I comment on picture and delete it
    Given I am logged in
    When I visit another user picture page
    And I write comment
    And I reload page
    Then I see my comment appeared
    When I delete my comment
    And I reload page
    Then I don't see my comment

  Scenario: I like and unlike a comment
    Given I am logged in
    Given Another user write comment
    When I visit another user picture page
    Then I see his comment
    When I like his comment
    Then I see that I liked his comment
    When I unlike his comment
    Then I see I can like his comment

  Scenario: Likes count
    Given Another user write comment
    Given 2 users like another user comment
    When I visit another user picture page
    Then comment likes count should be 2
    When 2 users unlike another user comment
    Then comment likes count should be 0
