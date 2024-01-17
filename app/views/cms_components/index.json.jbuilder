# frozen_string_literal: true

json.array! @cms_components, partial: 'components/component', as: :component
