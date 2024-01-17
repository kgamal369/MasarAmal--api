# frozen_string_literal: true

json.extract! treatment_approach, :id, :created_at, :updated_at
json.url treatment_approach_url(treatment_approach, format: :json)
