# frozen_string_literal: true

json.extract! mental_service, :id, :created_at, :updated_at
json.url mental_service_url(mental_service, format: :json)
