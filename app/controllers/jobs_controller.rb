class JobsController < ApplicationController
  def index
    if params[:q].present?
      @jobs = IndeedAPI.search_jobs(q: params[:q])
      @search_results = @jobs.results
    else
      @jobs = []
      @search_results = []
    end
  end
end

