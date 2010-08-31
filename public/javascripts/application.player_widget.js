PlayerWidget = function(attributes){
  this.raw = attributes || {};
  this.raw.player = new Player();

  if (this.raw.dom){
    this.initialize_events();
  }
};

PlayerWidget.prototype.dom = function(){
  return this.raw.dom;
};

PlayerWidget.prototype.initialize_events = function(){
  var widget = this;

  this.dom().find('.song .action.play').click(function(event){
    widget.play(PlayerWidget.song_from_event(event));
    event.preventDefault();
  });

  this.dom().find('.controls .action.pause').click(function(event){
    widget.pause();
    event.preventDefault();
  });

  this.dom().find('.controls .action.resume').click(function(event){
    widget.resume();
    event.preventDefault();
  });
};

PlayerWidget.prototype.message = function(){
  return this.dom().find('.message');
};

PlayerWidget.prototype.pause = function(){
  try {
    this.player().pause();
    this.refresh();
  }
  catch(error){
    this.message().html(error.message);
  }
};

PlayerWidget.prototype.play = function(song){
  this.player().play(song);
  this.refresh();
};

PlayerWidget.prototype.player = function(){
  return this.raw.player;
};

PlayerWidget.prototype.refresh = function(){
  this.dom().find('.field .title').html(this.song().title());
  this.dom().find('.field .artist').html(this.song().artist());

  if (this.player().is_playing()){
    this.dom().find('.field .status').html('Playing');
  }
  else {
    this.dom().find('.field .status').html('Paused');
  }
  this.message().html('');
};

PlayerWidget.prototype.resume = function(){
  try {
    this.player().resume();
    this.refresh();
  }
  catch(error){
    this.message().html(error.message);
  }
};

PlayerWidget.prototype.song = function(){
  return this.player().currently_playing_song();
};

//----------------------------------------------------------------------

PlayerWidget.song_from_event = function(event){
  var $song = $(event.currentTarget).parents('.song');
  var result = new Song({
    'artist': $song.find('.artist').text(),
    'title': $song.find('.title').text(),
  });
  return result;
};
