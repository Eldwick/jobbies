class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:portal]
  
  def splash
  end

  def portal
    @companies = Company.all
  end
end
