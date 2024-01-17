# frozen_string_literal: true

json.array! @cms_pages, partial: 'cms_pages/cms_page', as: :cms_page
