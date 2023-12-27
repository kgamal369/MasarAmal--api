Rails.application.routes.draw do
  resources :cms_values, path: 'values'
  resources :cms_section_components, path: 'section_components'
  resources :cms_page_sections, path: 'page_sections'
  resources :cms_languages, path: 'languages'
  resources :cms_components, path: 'components'
  resources :cms_sections, path: 'sections'
  resources :cms_pages, path: 'pages'
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
