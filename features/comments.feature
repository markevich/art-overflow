Feature: Leave comment
  Scenario: I comment on picture
    Given I am logged in
    Given picture
    When visit picture
    Then I leave important comment

  Scenario: I like a comment
    Given I am logged in
    Given picture
    Given another user leaves important comment
    When visit picture
    Then I like his comment
