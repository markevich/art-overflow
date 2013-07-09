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
    Then I delete my comment
    Then I see my comment deleted

  Scenario: I like and unlike a comment
    When Another user write comment
    Then I visit another user picture
    And I see his comment
    And I see I can like his comment
    Then I like his comment
    And I see that I liked his comment
    Then I unlike his comment
    And I see I can like his comment
