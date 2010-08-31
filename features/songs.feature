Feature: Manage songs
  As a speaker
  I want to write a demo app
  So that I can prove to myself that I know what I'm talking about

  Scenario: The Song page should have a player widget.
    Given I have some songs
    When I view the Songs page
    Then I should see the songs
    And I should see the player widget
    And the player widget should have buttons to play and pause the current song
    And there should be no song playing