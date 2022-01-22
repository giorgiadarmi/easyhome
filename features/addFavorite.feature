Feature: View favorite list  
    As a User
    So that I can view my favourite list
    I want to remove a ad to my favourites list.
    

    Scenario: User can add a ad to his favorites list
        Given I am authenticated 
        Given I am on my profile
        Then I should see the favorites list
