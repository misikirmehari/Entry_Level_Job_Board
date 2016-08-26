class JobsController < ApplicationController


  def index
    params[:q] ||= 'Ruby on Rails '
    params[:start_at] ||= 0
    @next_page = params[:start_at].to_i + 25

    @jobs = IndeedAPI.search_jobs(q: params[:q], l: '80202', limit: 50, start: params[:start_at])
    @search_results = @jobs.results
    
  end
end

