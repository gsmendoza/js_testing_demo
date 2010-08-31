Player = function(attributes){
  this.raw = attributes || {};
};

Player.prototype.currently_playing_song = function(){
  return this.raw.currently_playing_song;
};

Player.prototype.is_playing = function(){
  return this.raw.is_playing;
};

Player.prototype.make_favorite = function(){
  this.currently_playing_song().persist_favorite_status(true);
};

Player.prototype.pause = function(){
  this.raw.is_playing = false;
};

Player.prototype.play = function(song) {
  this.raw.currently_playing_song = song;
  this.raw.is_playing = true;
};

Player.prototype.resume = function(){
  if (this.is_playing()) {
    throw new Error("song is already playing");
  }
  this.raw.is_playing = true;
};

