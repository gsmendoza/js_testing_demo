ActionController::Routing::Routes.draw do |map|
  map.root :controller => :songs, :action => :index
  map.resources :songs
end
