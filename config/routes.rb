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
   get 'cms_values/arabic', to: 'cms_values#all_for_arabic', as: :cms_values_arabic
   get 'cms_values/english', to: 'cms_values#all_for_english', as: :cms_values_english
 
   # Custom routes for page-specific filtering
   get 'cms_values/home_page', to: 'cms_values#all_for_home_page', as: :cms_values_home_page
   get 'cms_values/doctors_page', to: 'cms_values#all_for_doctors_page', as: :cms_values_doctors_page
   get 'cms_values/treatment_page', to: 'cms_values#all_for_treatment_page', as: :cms_values_treatment_page
   get 'cms_values/service_page', to: 'cms_values#all_for_service_page', as: :cms_values_service_page
 
   # Custom routes for combined page and language filtering
   get 'cms_values/home_page/arabic', to: 'cms_values#home_page_arabic', as: :home_page_arabic_cms_values
   get 'cms_values/home_page/english', to: 'cms_values#home_page_english', as: :home_page_english_cms_values

   get 'cms_values/doctors_page/arabic', to: 'cms_values#all_for_doctors_page_arabic', as: :doctors_page_arabic_cms_values
   get 'cms_values/doctors_page/english', to: 'cms_values#all_for_doctors_page_english', as: :doctors_page_english_cms_values
  
   get 'cms_values/treatment_page/arabic', to: 'cms_values#all_for_treatment_page_arabic', as: :treatment_page_page_arabic_cms_values
   get 'cms_values/treatment_page/english', to: 'cms_values#all_for_treatment_page_english', as: :treatment_page_english_cms_values
   
   get 'cms_values/service_page/arabic', to: 'cms_values#all_for_service_page_arabic', as: :service_page_arabic_cms_values
   get 'cms_values/service_page/english', to: 'cms_values#all_for_service_page_english', as: :service_page_english_cms_values
 
   # ... and so on for other page and language combinations
end
