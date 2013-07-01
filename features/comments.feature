Feature: Leave comment
  Scenario: I comment on picture
    Given I am logged in
    Given picture
    When visit picture
    Then I leave important comment
