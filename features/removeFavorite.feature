Feature: Remove favorite and view favorite list  
    As a User
    
    So that I can remove to favorite
    I want view my favourites list on my profile.
    
    Scenario: User can add an ad to his favorites list
        Given I am authenticated 
        Given I am on app homepage 
            Given Ad "TEST_AD" with Descrizione "TEST_DESCRIPTION" is there
            When I click on "Dettagli" for Ad "TEST_AD" with Descrizione "TEST_DESCRIPTION" 
            Then I should see "Dettagli" for Ad "TEST_AD" with Descrizione "TEST_DESCRIPTION"
            When I click link "Rimuovi dai preferiti" for Ad "TEST_ARTICLE" with Descrizione "TEST_DESCRIPTION"
            Then I should be on the app homepage
        
    Scenario: User can view his favorites list
        Given I am on my profile
        Then I should be on my profile
        Then I should see the favorites list
