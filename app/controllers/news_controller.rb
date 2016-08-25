require 'searchbing'
class NewsController < ApplicationController

  def index
    @news_feed = Bing.new('jmKxP+B6VBhVca/1t+dRz8qv6ySvNSrykDmRYE/2qN4',10,'News' 'Rails')
    @news_results = @news_feed.search('Ruby on rails')
  end
end
