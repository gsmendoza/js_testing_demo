ActionController::Routing::Routes.draw do |map|
  map.root :controller => :pages, :action => :presentation
  map.resources :songs

  map.page '/pages/:action', :controller => 'pages', :conditions => {:method => :get}
end
