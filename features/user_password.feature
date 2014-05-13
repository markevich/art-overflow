@javascript
Feature: Change user password
  Scenario: Change user password
    Given I am logged in
    When I visit my profile settings path
    When I click change password link
    When I fill in my new password information
    Then I should see that password updated

