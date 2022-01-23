Feature: User can manually add a ads

Scenario: Add an ad
	Given I am authenticated
	Given I am on app homepage
	When I follow "Crea Annuncio"
	Then I should be on the Create New Ad Page
	When I fill in "Titolo" with "Mansarda"
	And I press "Save Changes"
	Then I should be on the app homepage
	And I should see "Mansarda"
