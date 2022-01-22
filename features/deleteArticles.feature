Feature: Delete an Article
    As an User
    So that I can delete an article

    Scenario: Admin can delete all recipes
		Given I am authenticated
	    Given I am on edilnews page
        And I click on link "Dettagli"
        And I click on link "Cancella articolo"
