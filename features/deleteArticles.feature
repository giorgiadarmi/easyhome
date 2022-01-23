Feature: Delete an Article
    As an User
    So that I can delete an article

    Scenario: User can delete all articles
		Given I am authenticated
	    Given I am on edilnews page
        Given Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR" is there
        When I click on "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        Then I should see "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        When I click link "Cancella articolo" for Article "TEST_ARTICLE" with Autore "TEST_AUTHOR"
        Then I should be on the edilnews page
        And I should not see Article "TEST_ARTICLE"
