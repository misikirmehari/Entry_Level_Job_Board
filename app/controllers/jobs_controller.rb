class JobsController < ApplicationController
  def index
    params[:q] ||= 'Ruby on Rails Denver'

    @jobs = IndeedAPI.search_jobs(q: params[:q])
    @search_results = @jobs.results
    
  end
end

