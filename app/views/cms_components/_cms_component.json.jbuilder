# frozen_string_literal: true

json.extract! component, :id, :name, :componenttype, :created_at, :updated_at
json.url component_url(component, format: :json)
