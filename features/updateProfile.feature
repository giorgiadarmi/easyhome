Feature: Update Profile 
    As a User
    I can add a name 

Scenario: User can update name
        Given I am authenticated
        When I am on app homepage
        And I follow "Profilo"
        Then I should be on my profile
        When I click link "Update"
        Then I should see "Update" for user 
        When I fill in "Nome" with "TEST_NOME"
        When I fill in "Password" with "easyhome.0102"
        When I fill in "Confirmation" with "easyhome.0102"
        And I press "Save Changes"
        When I fill in "Email" with "easyhome0102@gmail.com"
        When I fill in "Password" with "easyhome.0102"
        And I press "Log in"
        Then I should see "TEST_NOME"
