class ProxyController < ApplicationController
  def rss
    result = Net::HTTP.get(URI.parse(params["uri"]))
    render :xml => result
  end
end
