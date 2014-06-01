@javascript
Feature: Counter
  Scenario: I see users that liked picture
    Given Another user
    Given picture of another user
    Given I am logged in
    When I visit another user picture page
    When I like his picture
    When I click to likes counter link
    Then I should see link to my profile

  Scenario: I see users that liked picture
    Given Another user
    Given picture of another user
    Given I am logged in
    When I visit another user picture page
    When I click follow button
    When I click to follow counter link
    Then I should see link to my profile

  Scenario: I see users followers
    Given Another user
    Given I am logged in
    When I visit another user page
    When I click follow button
    When I click to followers counter link
    Then I should see link to my profile

  Scenario: I see users follows
    Given I am logged in
    Given Another user
    Given Another user follows me
    When I visit another user page
    When I click to follows counter link
    Then I should see link to my profile
