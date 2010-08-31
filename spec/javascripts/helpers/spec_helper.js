beforeEach(function() {
  this.addMatchers({
    to_be_playing: function(expected_song) {
      var player = this.actual;
      return player.currently_playing_song() === expected_song
          && player.is_playing();
    }
  })
});
