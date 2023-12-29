Rails.application.routes.draw do
 
  resources :cms_section_components, path: 'section_components'
  resources :cms_page_sections, path: 'page_sections'
  resources :cms_languages, path: 'languages'
  resources :cms_components, path: 'components'
  resources :cms_sections, path: 'sections'
  resources :cms_pages, path: 'pages'
  resources :cms_values, path: 'cms
  '
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


  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
  # Set ActiveAdmin dashboard as the root
  root to: 'admin/dashboard#index'

  # Custom routes for language-specific filtering
  get 'cms_values/language/:language', to: 'cms_values#filter_by_language', as: :cms_values_by_language

  # Custom routes for page-specific filtering
  get 'cms_values/page/:page_name', to: 'cms_values#filter_by_page', as: :cms_values_by_page

  # Custom routes for combined page and language filtering
  get 'cms_values/:page_name/:language', to: 'cms_values#filter_by_page_and_language', as: :custom_cms_values

   # ... and so on for other page and language combinations
end
