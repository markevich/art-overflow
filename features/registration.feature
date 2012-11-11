@registration
Feature: user registration

  Scenario: registration workflow for new user
    Given I open page "/"
    Then I click link "Sign in"
    Then I click link "Sign up"
    Then I fill following data in inputs
      | user[name]                  | Test user             |
      | user[email]                 | example@example.com   |
      | user[password]              | test123               |
      | user[password_confirmation] | test123               |
    Then I click button "Sign up"
    Then I should receive 1 email with subject "Confirmation instructions"
    Then I open the email
    Then I follow "Confirm my account" in the email
    Then page should have content "My account"
    # When click button "#add_to_basket_button"
    # Then path should be "/order"
    # Then click tab "#register-tab"
    # Then choose "type_payer_fiz"
    # Then he click tab ".next"
    # Then fill following data in inputs