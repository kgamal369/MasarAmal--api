Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Adjust this to be more restrictive as needed
      resource '*', 
        headers: :any, 
        methods: [:get, :post, :put, :delete, :options, :head]
    end
  end
  