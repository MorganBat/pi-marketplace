json.extract! user, :id, :name, :email, :location, :created_at, :updated_at
json.url user_url(user, format: :json)
