json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :email, :primary_phone, :secondary_phone, :title, :company_id
  json.url contact_url(contact, format: :json)
end
