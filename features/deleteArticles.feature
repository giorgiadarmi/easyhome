Feature: Delete an Article
    As an User
    So that I can delete an article

    Scenario: Admin can delete all recipes
		Given I am authenticated
	    Given I am on edilnews page
        Given Article "TEST_MOVIE" with Autore articolo "TEST_AUTHOR" is there
        When I click on "Dettagli" for Article "TEST_MOVIE" with Autore articolo "TEST_AUTHOR"
        Then I should see Article "TEST_MOVIE" with Autore articolo "TEST_AUTHOR"
