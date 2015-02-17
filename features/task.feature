Feature: Authorization
  In order to make notes private
  I am going to make them visible only to the note creator
  I want to add authorization

  @javascript
  Scenario: Add authorization
    Given that a user with email "user@example.com" and password "rahasyam" exist
    And I am in home page
    When I press "Login" in "header"
    And I fill in "user[email]" with "user@example.com"
    And I fill in "user[password]" with "rahasyam"
    And I press "Login" in "form"
    And I should see "Logged in as user@example.com"
    Then I should see "My Notes"
    When I enter "Remember Milk" in note input
    And I press "Add Note"
    When I go to home page
    Then I should see "Remember Milk"
    When I press "Logout"
    Then I should not see "Logged in as"
    Given that a user with email "user1@example.com" and password "rahasyam" exist
    And I am in home page
    When I press "Login" in "header"
    And I fill in "user[email]" with "user1@example.com"
    And I fill in "user[password]" with "rahasyam"
    And I press "Login" in "form"
    And I should see "Logged in as user1@example.com"
    And I should not see "Remember Milk"