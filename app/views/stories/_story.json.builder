json.extract! user, :id, :title, :description, :genre, :created_at, :updated_at
json.url user_url(user, format: :json)
