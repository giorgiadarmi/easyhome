Feature: Delete an Article
    As an User I am not Admin
    So I cannot delete an article

    Scenario: User cannot delete articles
        Given I am authenticated
        Given I am on edilnews page
        Given Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR" is there
        When I click on "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        Then I should see "Dettagli" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        When I click link "Cancella articolo" for Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
        Then I should be on the edilnews page
        And I should see Article "TEST_ARTICLE" with Autore articolo "TEST_AUTHOR"
