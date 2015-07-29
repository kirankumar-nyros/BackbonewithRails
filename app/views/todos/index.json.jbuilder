json.array!(@todos) do |todo|
  json.extract! todo, :id, :content, :order, :done
  json.url todo_url(todo, format: :json)
end
