json.extract! cms_value, :id, :value, :page_section_id, :section_component_id, :language_id, :created_at, :updated_at
json.url cms_value_url(cms_value, format: :json)
