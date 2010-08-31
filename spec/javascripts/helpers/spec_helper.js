beforeEach(function() {
  this.addMatchers({
    toBePlaying: function(expectedSong) {
      var player = this.actual;
      return player.currently_playing_song === expectedSong
          && player.is_playing;
    }
  })
});
