Feature: User Registration
  Scenario: User Registration
    Given I am unregistered user
    When I visit registration page
    When I submit registration form
    Then I should see that confirmation email sended
    Then I confirm my account through email
    Then I should see that my account is confirmed

  Scenario: User authentication
    Given I am registered user
    When I visit authentication page
    And I fill in my login and password
    Then I should see that I am authorized

  Scenario: See latest pictures of another user
    Given I am logged in
    Given Another user
    Given picture of another user
    When I visit another user page
    Then I visit latest user pictures page
    Then I see pictures on page
