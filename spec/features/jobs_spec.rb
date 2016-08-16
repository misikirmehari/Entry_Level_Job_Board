require 'rails_helper'

feature 'Job Search ' do
  scenario 'allows a users to search for jobs' do
    search_results_test = IndeedAPI.search_jobs(q: "ruby on rails").results.first

    visit jobs_path
    fill_in :q, with: 'ruby on rails'

    click_button 'search'
    expect(page).to have_text("#{search_results_test.job_title}")
    expect(page).to have_text("#{search_results_test.company}")
    expect(page).to have_text("#{search_results_test.formatted_location}")
    expect(page).to have_text("#{search_results_test.snippet}")
  end
end
