json.array!(@propositions) do |proposition|
  json.extract! proposition, :id, :title, :descrition, :resolved
  json.url proposition_url(proposition, format: :json)
end
