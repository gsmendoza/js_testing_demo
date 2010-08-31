function Player() {
}
Player.prototype.play = function(song) {
  this.currently_playing_song = song;
  this.is_playing = true;
};

Player.prototype.pause = function() {
  this.is_playing = false;
};

Player.prototype.resume = function() {
  if (this.is_playing) {
    throw new Error("song is already playing");
  }

  this.is_playing = true;
};

Player.prototype.make_favorite = function() {
  this.currently_playing_song.persist_favorite_status(true);
};
