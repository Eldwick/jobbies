json.array!(@companies) do |company|
  json.extract! company, :id, :name, :street_address, :city, :state, :zip_code, :num_employees, :rating, :category
  json.url company_url(company, format: :json)
end
