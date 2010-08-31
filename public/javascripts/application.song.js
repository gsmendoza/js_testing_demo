function Song(attributes) {
  this.raw = attributes;
}

Song.prototype.persist_favorite_status = function(value) {
  // something complicated
  throw new Error("not yet implemented");
};
