require 'open-uri'

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    if current_user.jobs.where(id: @job.id).count == 0
      @job_application = nil
    else
      @job_application = Application.find_by(job_id: @job.id)
    end
    current_user.geocode
    @distance = current_user.distance_from(@job.geocode).to_i
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @companies = Company.all
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_linkedin
    # begin 
      job_url = params[:job_url].downcase 
      link = open(job_url)
      doc = Nokogiri::HTML(link)

      description =  doc.css('.description-section div').to_s

      company_name = doc.css('.company span').text

      name = doc.css('.left-entity h1 span').text

      title = doc.css('h1.title').text

      location = doc.css('.sub-header span span').text

      company = Company.find_by(name: company_name)

      job_details = {
        name: title,
        description: description,
        location: location,
        company_id: company.id
      }

      job = Job.create(job_details)
      redirect_to job_path(job)
    # rescue  
    #   puts 'No Company Found'
    #   redirect_to root_path  
    # end  
  end

  def search
    @jobs = Job.search(name: params[:name][0].downcase, location: params[:location][0].downcase, company_id: params[:company][0])
    render "index"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:average_pay, :description, :name, :street_address, :city, :state, :qualifications, :zip_code, :company_id)
    end
end
