Feature: Promotions
  Scenario: New promotion registration
    Given I am new user
    When I visit promotion page
    When I submit promotion form
    Then I should be subscribed to promo news

  Scenario: Given I am existing promo subscriber
    Given I am existing promo subscriber
    When I visit promotion page
    When I submit promotion form
    Then I should see that I already subscribed

