@javascript
Feature: Pictures
  Scenario: Endless scrolling
    Given that many pictures exists
    Given I am on pictures page
    Given I remember the number of pictures
    When I click show more button
    Then new pictures should appear on page
    When I scroll to next page
    Then new pictures should appear on page
    And I should see "page=2" in current path
    When I scroll to bottom of screen
    Then I should see "page=3" in current path

  Scenario: Show more button should not be visible if there are no more pictures
    Given that few pictures exists
    When I am on pictures page
    Then I should not see show more button

  Scenario: I like and unlike a picture
    Given Another user
    Given picture of another user
    Given I am logged in
    When I visit another user picture page
    Then I see 0 likes on picture
    When I like his picture
    And I reload page
    Then I see 1 like on picture
    When I unlike his picture
    And I reload page
    Then I see 0 likes on picture
