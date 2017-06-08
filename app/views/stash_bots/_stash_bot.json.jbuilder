json.extract! stash_bot, :id, :name, :secret_code, :prefs, :created_at, :updated_at
json.url stash_bot_url(stash_bot, format: :json)
