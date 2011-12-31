Feature: Posting actions on my dashboard
  As a User,
  I want to post report my daily actions
  So that they are saved

  Scenario: Report a eating action
	  Given I am logged
	  And there is an Eating action available
	  When I select an Eating action
	  Then it should be registered