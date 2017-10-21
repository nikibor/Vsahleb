json.extract! user, :id, :name, :password,:password_confirmation, :email, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
