class StaticPagesController < ApplicationController

  def index
    params[:q] ||= 'Ruby on Rails Denver'
    @jobs = IndeedAPI.search_jobs(q: params[:q])
    @jobs.end
    @search_results = @jobs.results

    @news_feed = Bing.new('jmKxP+B6VBhVca/1t+dRz8qv6ySvNSrykDmRYE/2qN4',2,'News' )
    @news_results = @news_feed.search('Ruby on rails')

  end

  def about

  end

  def contact

  end

  def resource

  end

end
