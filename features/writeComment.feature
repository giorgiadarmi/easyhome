Feature: Write a comment of an articles
    As a User
    
    So that I can write a comment of an articles
    
    Scenario: User can write a comment of an articles
        Given I am authenticated
	    Given I am on edilnews page
        Given Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR" is there
        When I click on "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        Then I should see "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        When I write a comment "TEXT_COMMENT"
        And I press button "Pubblica"
        Then I should see comment "TEXT_COMMENT" in the article page

