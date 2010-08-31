App = {};

$(function(){
  App.player_widgets = [];
  $('.player').each(function(){
    App.player_widgets.push(new PlayerWidget({'dom': $(this)}));
  });
});
