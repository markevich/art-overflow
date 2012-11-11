@registration
Feature: user registration

  Scenario: registration workflow for new user
    When open page "/"
    Then click link "Sign in"
    Then click link "Sign up"
    Then fill following data in inputs
      | user[name]                  | Test user          |
      | user[email]                 | test@example.com   |
      | user[password]              | test123            |
      | user[password_confirmation] | test123            |
    Then click button "Sign up"
    Then page should have content "My account"
    # When click button "#add_to_basket_button"
    # Then path should be "/order"
    # Then click tab "#register-tab"
    # Then choose "type_payer_fiz"
    # Then he click tab ".next"
    # Then fill following data in inputs