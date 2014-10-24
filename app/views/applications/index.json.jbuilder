json.array!(@applications) do |application|
  json.extract! application, :id, :status
  json.url application_url(application, format: :json)
end
