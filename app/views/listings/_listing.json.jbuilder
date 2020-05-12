json.extract! listing, :id, :name, :type, :price, :software, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
