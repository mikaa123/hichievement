Feature: Login with social network accounts
  As a user,
  I want to log-in with my social network account
  So that I can access my account

  Scenario: Failed connection
    Given I am not logged
    When I click on login
    And I enter wrong information
    Then I shouldn't be logged

  Scenario: Connection succeeds
    Given I am not logged
    When I click on login
    And I enter valid credentials
    Then I should be logged