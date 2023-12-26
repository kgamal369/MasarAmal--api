Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Your main application routes

  resources :user_roles
  resources :roles
  resources :cmses
  resources :doctors
  resources :facilities

      # ... (other resources)

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
  # Set ActiveAdmin dashboard as the root
  root to: 'admin/dashboard#index'
end
