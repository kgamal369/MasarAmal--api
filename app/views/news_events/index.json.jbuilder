# frozen_string_literal: true

json.array! @news_events, partial: 'news_events/news_event', as: :news_event
