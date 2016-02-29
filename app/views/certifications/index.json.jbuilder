json.array!(@certifications) do |certification|
  json.extract! certification, :id, :certification_name, :certification_authority, :certification_number, :certification_url
  json.url certification_url(certification, format: :json)
end
