require 'open-uri'
class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    current_user.geocode
    @distance = current_user.distance_from(@company.geocode)
    @distance = @distance.to_i unless @distance.nan?
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_from_linkedin
    check_company = Company.where("lower(name) like ?", "#{params[:companyname].downcase}" )
    if !check_company.blank?
      return redirect_to company_path(check_company[0])
    end
    company_name = params[:companyname].downcase 
    company = Company.create_from_linkedin(company_name)
    if company
      redirect_to company_path(company)
    else
      redirect_to new_company_path
    end
  end

  def search
    @companies = Company.search(name: params[:name][0].downcase, city: params[:city][0].downcase, category: params[:category][0].downcase)
    render "index"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :street_address, :city, :state, :zip_code, :num_employees, :rating, :category)
    end
end
