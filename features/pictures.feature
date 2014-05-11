@javascript
Feature: Pictures
  Scenario: Endless scrolling
    Given that many pictures exists
    Given I am on pictures page
    Then I see 30 pictures on page
    When I scroll to half of document
    And I should see "page=2" in current path
    When I scroll to bottom of document
    Then new pictures should appear on page
    When I scroll to half of document
    And I should see "page=3" in current path

  Scenario: I like and unlike a picture
    Given Another user
    Given picture of another user
    Given I am logged in
    When I visit another user picture page
    Then I see 0 likes on picture
    When I like his picture
    Then I see 1 like on picture
    When I unlike his picture
    Then I see 0 likes on picture

  Scenario: I like picture when unauthorized
    Given Another user
    Given picture of another user
    Given I am registered user
    When I visit another user picture page
    Then I see 0 likes on picture
    When I like his picture
    Then I should be on authorization page
    When I fill in my login and password
    Then I should be on another user picture page
    When I like his picture
    Then I see 1 like on picture

  Scenario: I follow and unfollow an author
    Given Another user
    Given picture of another user
    Given I am logged in
    When I visit another user picture page
    Then I should see that i am not following that user
    When I click follow button
    Then I should see that i am following that user
    When I click unfollow button
    Then I should see that i am not following that user

  Scenario: I edit my picture
    Given I am logged in
    Given my picture
    When I visit my picture page
    Then I click edit picture
    Then I change picture name
    Then I change picture description
    Then I click save
    Then I should see that my picture is edited
