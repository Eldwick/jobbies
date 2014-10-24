json.array!(@jobs) do |job|
  json.extract! job, :id, :average_pay, :description, :name, :street_address, :city, :state, :qualifications, :zip_code, :company_id
  json.url job_url(job, format: :json)
end
