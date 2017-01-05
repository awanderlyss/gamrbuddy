json.extract! game, :id, :title, :genre, :developer, :release_date, :img_url, :created_at, :updated_at
json.url game_url(game, format: :json)