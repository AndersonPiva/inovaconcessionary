json.extract! vehicle, :id, :title, :value, :description, :year, :model_id, :category_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)