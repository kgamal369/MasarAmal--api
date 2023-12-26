Rails.application.routes.draw do
  # Rswag API and UI routes
  mount Rswag::Api::Engine => '/api/docs'
  mount Rswag::Ui::Engine => '/api/docs/swagger'

  # ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Your main application routes
  namespace :api do
    namespace :v1 do
      resources :user_roles
      resources :roles
      # ... (other resources)

      # Swagger JSON endpoint
      get '/swagger.json', to: 'swagger#index'
    end
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
  # Set ActiveAdmin dashboard as the root
  root to: 'admin/dashboard#index'
end
