ActionController::Routing::Routes.draw do |map|
  map.resources :candidates, :collection => { :next => :get, :aye => :get, :nay => :get, :maybe => :get }, 
                             :member =>{:vote_aye => :post, :vote_nay => :post, :vote_maybe => :post }

  map.proxy "proxy", :controller => "proxy", :action => "rss"
  
  map.rpx "rpx", :controller => "sessions", :action => "rpx"
  map.logout '/logout', :controller => 'sessions', :action => 'logout'
  
  map.root :controller => "candidates"
end
