json.array!(@races) do |race|
  json.extract! race, :id, :name, :description, :date, :target, :mainImage, :secondImage, :thirdImage, :route_id, :user_id, :playlist_id
  json.url race_url(race, format: :json)
end
