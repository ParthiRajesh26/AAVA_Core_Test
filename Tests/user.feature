Feature: User Registration
  Scenario: Successful registration with valid details
    Given I am a new user on the registration page
    When I enter my name, a valid email address, and a strong password
    And I submit the registration form
    Then my account should be created
    And I should be redirected to the welcome page

  Scenario: Registration with invalid email format
    Given I am a new user on the registration page
    When I enter my name, an invalid email address, and a strong password
    And I submit the registration form
    Then I should see an error message indicating invalid email format
    And my account should not be created

  Scenario: Registration with weak password
    Given I am a new user on the registration page
    When I enter my name, a valid email address, and a weak password
    And I submit the registration form
    Then I should see an error message indicating password strength requirements
    And my account should not be created

Feature: Password Reset
  Scenario: Request password reset link
    Given I am on the login page
    When I request a password reset link by entering my registered email address
    Then I should receive a password reset link via email

  Scenario: Reset link expires after 24 hours
    Given I have received a password reset link
    When I try to use the link after 24 hours
    Then I should see a message indicating the link has expired
    And I should not be able to reset my password

  Scenario: Set a new password that meets security requirements
    Given I have a valid password reset link
    When I enter a new strong password and confirm it
    Then my password should be updated
    And I should be able to log in with the new password

  Scenario: Set a new password that does not meet security requirements
    Given I have a valid password reset link
    When I enter a new weak password and confirm it
    Then I should see an error message indicating password strength requirements
    And my password should not be updated

Feature: Profile Update
  Scenario: Update profile information successfully
    Given I am logged in and on my profile page
    When I update my name, email address, and profile picture with valid information
    And I save the changes
    Then my updated information should be saved
    And the changes should be reflected immediately

  Scenario: Update profile with invalid email format
    Given I am logged in and on my profile page
    When I update my email address with an invalid format
    And I save the changes
    Then I should see an error message indicating invalid email format
    And the changes should not be saved
