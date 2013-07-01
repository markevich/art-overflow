Feature: User Registration
  Scenario: User Registration
    Given I am unregistered user
    When I visit registration page
    When I submit registration form
    Then I should see that confirmation email sended
    Then I confirm my account through email
    Then I should see that my account is confirmed
