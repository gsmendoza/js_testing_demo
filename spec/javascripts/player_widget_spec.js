describe("PlayerWidget", function(){
  it("can be constructed", function(){
    var dom = $('<div><div/>');
    var widget = new PlayerWidget({'dom': dom});
    expect(widget.dom()).toEqual(dom);
    expect(widget.player()).not.toBeFalsy();
  });

  it("can play a song", function(){
    var song = new Song({'artist': 'Merle Travis', 'title': 'Sixteen tons'});

    var widget = new PlayerWidget({'dom': $('<div><div/>')});
    spyOn(widget.player(), 'play');
    spyOn(widget, 'refresh')

    widget.play(song);

    expect(widget.player().play).toHaveBeenCalledWith(song);
    expect(widget.refresh).toHaveBeenCalled();
  });

  describe("widget.refresh", function(){
    it("should update the artist, title and clear the message", function(){
      loadFixtures('spec/javascripts/fixtures/songs-index.html');
      var widget = new PlayerWidget({'dom': $('.player')});

      widget.dom().find('.message').html('some old error');

      var song = new Song({'artist': 'Merle Travis', 'title': 'Sixteen tons'});
      widget.song = function(){ return song };

      widget.refresh();

      expect(widget.dom().find('.field .artist')).toHaveText('Merle Travis');
      expect(widget.dom().find('.field .title')).toHaveText('Sixteen tons');
      expect(widget.dom().find('.field .message')).toHaveText('');
    });

    it("should set the status to Playing if it is playing a song", function(){
      loadFixtures('spec/javascripts/fixtures/songs-index.html');
      var widget = new PlayerWidget({'dom': $('.player')});
      widget.player().raw.is_playing = true;

      var song = new Song({'artist': 'Merle Travis', 'title': 'Sixteen tons'});
      widget.song = function(){ return song };

      widget.refresh();

      expect(widget.dom().find('.status')).toHaveText('Playing');
    });

    it("should set the status to Paused if its song is paused", function(){
      loadFixtures('spec/javascripts/fixtures/songs-index.html');
      var widget = new PlayerWidget({'dom': $('.player')});
      widget.player().raw.is_playing = false;

      var song = new Song({'artist': 'Merle Travis', 'title': 'Sixteen tons'});
      widget.song = function(){ return song };

      widget.refresh();

      expect(widget.dom().find('.status')).toHaveText('Paused');
    });
  });

  describe("widget.song", function(){
    it("should be the player's currently playing song", function(){
      var song = new Song({'artist': 'Merle Travis', 'title': 'Sixteen tons'});

      var widget = new PlayerWidget();
      widget.player().play(song);

      expect(widget.song()).toEqual(song);

    });
  });

  describe("widget.song_from_event(event)", function(){
    it("should return a song representing the event's current target", function(){
      loadFixtures('spec/javascripts/fixtures/songs-index.html');

      var $song = $('.song').first();
      expect($song.find('a').text()).toBeTruthy();

      var event = {};
      event.currentTarget = $song.find('a').get();

      var result = PlayerWidget.song_from_event(event);

      expect(result.artist()).toEqual($song.find('.artist').text());
      expect(result.title()).toEqual($song.find('.title').text());
    });
  });
});
