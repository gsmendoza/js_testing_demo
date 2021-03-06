describe("Player", function() {
  var player;
  var song;

  beforeEach(function() {
    player = new Player();
    song = new Song();
  });

  it("should be able to play a Song", function() {
    player.play(song);
    expect(player.currently_playing_song()).toEqual(song);

    //demonstrates use of custom matcher
    expect(player).to_be_playing(song);
  });

  describe("when song has been paused", function() {
    beforeEach(function() {
      player.play(song);
      player.pause();
    });

    it("should indicate that the song is currently paused", function() {
      expect(player.is_playing()).toBeFalsy();

      // demonstrates use of 'not' with a custom matcher
      expect(player).not.to_be_playing(song);
    });

    it("should be possible to resume", function() {
      player.resume();
      expect(player.is_playing()).toBeTruthy();
      expect(player.currently_playing_song()).toEqual(song);
    });
  });

  // demonstrates use of spies to intercept and test method calls
  it("tells the current song if the user has made it a favorite", function() {
    spyOn(song, 'persist_favorite_status');

    player.play(song);
    player.make_favorite();

    expect(song.persist_favorite_status).toHaveBeenCalledWith(true);
  });

  //demonstrates use of expected exceptions
  describe("#resume", function() {
    it("should throw an exception if Song is already playing", function() {
      player.play(song);

      expect(function() {
        player.resume();
      }).toThrow("Song is already playing");
    });
  });
});
