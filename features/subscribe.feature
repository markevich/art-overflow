@javascript
Feature: Promotions
  Scenario: New subscriber registration
    Given I am new subscriber
    When I visit subscribe page
    When I submit subscribe form
    Then I should see that i successfully subscribed

  Scenario: Subscribe for existing user
    Given I am existing subscriber
    When I visit subscribe page
    When I submit subscribe form
    Then I should see that I already subscribed

  Scenario: Unsubscribe existing user
    Given I am existing subscriber
    When I visit unsubscribe page
    Then I should see that I am unsubscribed
