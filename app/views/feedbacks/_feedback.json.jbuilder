json.extract! feedback, :id, :product_id, :user_id, :body, :rate, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
