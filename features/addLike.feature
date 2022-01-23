Feature: Like to an Article
    As an User
    I can put like to an article

    Scenario: User can put like to an article
		Given I am authenticated
	    Given I am on edilnews page
        Given Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR" is there
        When I click on "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        Then I should see "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        When I follow image link "Like"

    Scenario: User can view his like 
        Given I am on my profile
        Then I should be on my profile
        Then I should see the like of the articles
