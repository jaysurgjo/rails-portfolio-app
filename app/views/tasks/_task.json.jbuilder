json.extract! task, :id, :name, :facts, :created_at, :updated_at
json.url task_url(task, format: :json)
