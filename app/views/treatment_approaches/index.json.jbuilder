# frozen_string_literal: true

json.array! @treatment_approaches, partial: 'treatment_approaches/treatment_approach', as: :treatment_approach
