json.array!(@votes) do |vote|
  json.extract! vote, :id, :number
  json.url vote_url(vote, format: :json)
end
