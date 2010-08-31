function Song(attributes) {
  this.raw = attributes;
}

 Song.prototype.artist = function(){
  return this.raw.artist;
};

Song.prototype.persist_favorite_status = function(value) {
  // something complicated
  throw new Error("not yet implemented");
};

 Song.prototype.title = function(){
  return this.raw.title;
};

