Feature: User Registration
  Scenario: User Registration
    Given I am unregistered user
    When I visit registration page
    When I submit registration form
    Then I should see that i successfully registered
    Then mail should be sended to me
    And mail should contain confirmation link
    When I click confirmation link
    Then my account confirmed
