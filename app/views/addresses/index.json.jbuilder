json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :number, :colony, :cp, :city, :state, :country
  json.url address_url(address, format: :json)
end
