# frozen_string_literal: true

json.extract! page, :id, :name, :created_at, :updated_at
json.url page_url(page, format: :json)
