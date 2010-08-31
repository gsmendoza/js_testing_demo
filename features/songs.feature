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

  @javascript
  Scenario: Clicking a song should play the song.
    Given I have some songs
    And I am in the Songs page
    And no song is playing
    When I click a song
    Then I should see that the song is playing

  @javascript
  Scenario: Clicking a song should replace the song currently playing.
    Given I have some songs
    And I am in the Songs page
    And song A is playing
    When I click song B
    Then I should see that song B is playing

  @javascript
  Scenario: Clicking the pause button should pause the song currently playing.
    Given I have some songs
    And I am in the Songs page
    And song A is playing
    When I click the Pause button
    Then I should see that song A is paused

  @javascript
  Scenario: Clicking a song should replace the song currently paused.
    Given I have some songs
    And I am in the Songs page
    And song A is paused
    When I click song B
    Then I should see that song B is playing
