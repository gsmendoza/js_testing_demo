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
    When I click song A
    Then I should see that song A is playing

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

  @javascript
  Scenario: Cannot click the pause button if there is no song playing.
    Given I have some songs
    And I am in the Songs page
    And no song is playing
    When I click the Pause button
    Then I should see the error "No song is playing"

  @javascript
  Scenario: Clicking the play button should resume a paused song.
    Given I have some songs
    And I am in the Songs page
    And song A is paused
    When I click the Play button
    Then I should see that song A is playing

  @javascript
  Scenario: Cannot click the play button if there is a song playing.
    Given I have some songs
    And I am in the Songs page
    And song A is playing
    When I click the Play button
    Then I should see the error "song is already playing"
