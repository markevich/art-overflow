@javascript
Feature: Pictures
  Scenario: Endless scrolling
    Given that many pictures exists
    Given I am on pictures page
    Given I remember the number of pictures
    When I click show more button
    Then new pictures should appear on page
    When I scroll to bottom of page
    Then new pictures should appear on page

  Scenario: Visibility of "Show more button"
    Given that few pictures exists
    When I am on pictures page
    Then I should not see show more button
