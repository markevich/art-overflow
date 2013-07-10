@javascript
Feature: Leave comment
  Background:
    Given I am logged in
    Given Another user 
    Given picture of another user

  Scenario: I comment on picture and delete it
    When I visit another user picture
    And I write comment
    Then I see my comment appeared
    When I delete my comment
    Then I don't see my comment

  Scenario: I like and unlike a comment
    Given Another user write comment
    When I visit another user picture
    Then I see his comment
    When I like his comment
    Then I see that I liked his comment
    When I unlike his comment
    Then I see I can like his comment
