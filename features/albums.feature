@javascript
Feature: Album CRUD
  Background:
    Given I am logged in

  Scenario: Create album
    When I visit My profile page
    When I click Albums link
    Then I should see new album button
    When I click new album button
    When I click create album button
    Then I should see album validation error
    When I fill in new album fields
    When I click create album button
    Then I should see that new album is created
    And I see my new album in list
    Then I click on my album
    Then I click on edit album
    Then I click on delete album
    Then I should see that new album is deleted
