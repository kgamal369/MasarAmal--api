# frozen_string_literal: true

json.array! @cms_values, partial: 'cms_values/cms_value', as: :cms_value
