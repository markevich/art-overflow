@javascript
Feature: Promotions
  Scenario: New promotion registration
    Given I am new subscriber
    When I visit subscribe page
    When I submit subscribe form
    Then I should see that i successfully subscribed

  Scenario: Given I am existing subscriber
    Given I am existing subscriber
    When I visit subscribe page
    When I submit subscribe form
    Then I should see that I already subscribed

