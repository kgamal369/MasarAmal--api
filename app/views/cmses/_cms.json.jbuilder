json.extract! cms, :id, :pageName, :language, :location, :type, :value, :last_modified_date, :created_at, :updated_at
json.url cms_url(cms, format: :json)
