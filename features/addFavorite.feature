Feature: View favorite list  
    As a User
    So that I can view my favourite list
    I want to remove a ad to my favourites list.
    
    Scenario: User can add a ad to his favorites list
        Given I am authenticated 
        Given I am on my profile
        Then I should be on my profile
        Then I should see the favorites list
        When I click on link "Rimuovi dai preferiti"
        Then I should not see the ad
