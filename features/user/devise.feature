@registration
Feature: user devise workflow

  Scenario: registration for new user
    Given I am not logged in
    Given I open page "/"
    Then I click link "Sign in"
    Then I click link "Sign up"
    Then I fill following data in inputs
      | user[name]                  | Test user             |
      | user[email]                 | example@example.com   |
      | user[password]              | test123               |
      | user[password_confirmation] | test123               |
    Then I click button "Sign up"
    Then page should have content "Please open the link to activate your account"
    Then I should receive 1 email with subject "Confirmation instructions"
    Then I open the email
    Then I follow "Confirm my account" in the email
    Then page should have content "Your account was successfully confirmed."
    And page should have content "My account"

  Scenario: registration with facebook
    Given account in facebook
    Given I open page "/"
    Then I click link "Sign in"
    Then I click link "Sign in with Facebook"
    Then page should have content "Successfully authenticated from Facebook account."

  Scenario: autentication with facebook
    Given account with facebook
    Given account in facebook
    Given I open page "/"
    Then I click link "Sign in"
    Then I click link "Sign in with Facebook"
    Then page should have content "Successfully authenticated from Facebook account."