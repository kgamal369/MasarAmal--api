Rails.application.routes.draw do
 
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
  resources :cms_values do
    collection do
      get 'all_for_arabic'
      get 'all_for_english'
      get 'all_for_home_page'
      get 'all_for_doctors_page'
      get 'all_for_treatment_page'
      get 'all_for_service_page'
      get 'home_page_arabic'
      get 'home_page_english'
      get 'doctors_page_arabic'
      get 'doctors_page_english'
      get 'treatment_page_arabic'
      get 'treatment_page_english'
      get 'service_page_arabic'
      get 'service_page_english'
      get 'home_page_hero_section'
      get 'home_page_cards_section'
      get 'home_page_about_us_section'
      get 'home_page_services_section'
      get 'doctors_page_hero_section'
      get 'doctors_page_referral_criteria_section'
      get 'doctors_page_login_section'
      get 'treatment_page_hero_section'
      get 'treatment_page_doctors_section'
      get 'treatment_page_approach_section'
      get 'treatment_page_plans_section'
      get 'service_page_hero_section'
      get 'service_page_cards_section'
      get 'service_page_services_section'
      get 'home_page_hero_section_arabic'
      get 'home_page_hero_section_english'
      # ... Additional routes for other combinations ...
    end
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
  # Set ActiveAdmin dashboard as the root
  root to: 'admin/dashboard#index'
end
