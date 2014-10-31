class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:portal]
  before_action :get_companies_jobs, only: [:splash]

  def splash
    @company = Company.new
  end

  def portal
    @companies = Company.all
  end

  def search
    if params[:commit] == "Search Jobs"
      @jobs = Job.search(name: params[:name][0])
      render "jobs/index"
    else params[:commit] == "Search Companies"
      @companies = Company.search(name: params[:name][0])
      render "companies/index"
    end
  end
  private

  def get_companies_jobs
    @companies = Company.all
    @jobs = Job.all
  end
end
