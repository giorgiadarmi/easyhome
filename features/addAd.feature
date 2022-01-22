Feature: User can manually add a ads

Scenario: Add a articles
	Given I am on app homepage
	When I follow "Crea Annuncio"
	Then I should be on the Create New Ad Page
	When I fill in "title" with "Attico in centro"
	And I press "Save Changes"
	Then I should be on the app homepage
	And I should see "Attico in centro"
