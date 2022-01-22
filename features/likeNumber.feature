Feature: Like number of an articles
    As an User
    So that I can view like number of an article

    Scenario: User can view the number of like
		Given I am authenticated
	    Given I am on edilnews page
		Then I should see "#like"

