Feature: Add favorite and view favorite list  
    As a User
    
    So that I can add to favorite
    I want view my favourites list on my profile.
    
    Scenario: User can add an ad to his favorites list
        Given I am authenticated 
        Given I am on app homepage 
        Given I am on app homepage
	    When I follow "Crea Annuncio"
	    Then I should be on the Create New Ad Page
	    When I fill in "Titolo" with "Mansarda"
	    And I press "Save Changes"
	    Then I should be on the app homepage
	    And I should see "Mansarda"
        When I click on "Dettagli" for Ad "Mansarda" 
        Then I should see "Dettagli" for Ad "Mansarda" 
        When I follow image link "Favorite"
        Then I should be on the app homepage
        
    Scenario: User can view his favorites list
        Given I am on my profile
        Then I should be on my profile
        Then I should see the favorites list
        
