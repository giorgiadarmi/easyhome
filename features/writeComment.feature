Feature: Write a comment of an articles
    As a User
    
    So that I can write a comment of an articles
    
    Scenario: User can write a comment of an articles
        Given I am authenticated 
        Given I am on article page
        When I write a comment "TEXT_COMMENT"
        And I press button "Pubblica"
        Then I should see comment "TEXT_COMMENT" in the article page

