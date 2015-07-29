json.array!(@getflows) do |getflow|
  json.extract! getflow, :id, :name, :title, :completed
  json.url getflow_url(getflow, format: :json)
end
