ActionController::Routing::Routes.draw do |map|
  map.resources :candidates

  map.proxy "proxy", :controller => "proxy", :action => "rss"
  map.root :controller => "candidates"
end
