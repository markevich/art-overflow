@javascript
Feature: Leave comment
  Scenario: I comment on picture
    Given I am logged in
    Given picture of another user
    When visit picture
    Then I leave important comment
    Then I see my important comment

  Scenario: I like a comment
    Given I am logged in
    Given picture of another user
    Given Another user 
    And Another user leaves important comment
    When visit picture
    Then I see his comment
    Then I like his comment
    Then I see that I liked his comment
