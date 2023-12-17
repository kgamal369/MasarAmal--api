json.extract! news_event, :id, :created_at, :updated_at
json.url news_event_url(news_event, format: :json)
