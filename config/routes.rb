# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cms_section_components, path: 'section_components'
  resources :cms_page_sections, path: 'page_sections'
  resources :cms_languages, path: 'languages'
  resources :cms_components, path: 'components'
  resources :cms_sections, path: 'sections'
  resources :cms_pages, path: 'pages'
  resources :cms_values, path: 'cms_values'

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
  get 'up' => 'rails/health#show', as: :rails_health_check
  # Set ActiveAdmin dashboard as the root
  root to: 'admin/dashboard#index'
  # Custom routes for cms_values

  get 'cms_values/dropdownlist_sections_for_page/:page_id', to: 'cms_values#dropdownlist_sections_for_page'
  get 'cms_values/dropdownlist_components_for_section/:section_id',
      to: 'cms_values#dropdownlist_components_for_section'
  get 'cms_values/is_image_component/:component_id', to: 'cms_values#is_image_component'


  # Standard resource routes for cms_values
  resources :cms_values, path: 'cms_values' do
    collection do
      get 'language/:language', to: 'cms_values#filter_by_language', as: :cms_values_by_language
      get 'page/:page_name', to: 'cms_values#filter_by_page', as: :cms_values_by_page
      get ':page_name/:language', to: 'cms_values#filter_by_page_and_language', as: :custom_cms_values
      get 'page/:page_name/section/:section_name',
          to: 'cms_values#filter_by_page_and_section', as: :cms_values_page_section
      get 'page/:page_name/section/:section_name/language/:language',
          to: 'cms_values#filter_by_page_section_and_language', as: :cms_values_page_section_language
      get 'page/:page_name/section/:section_name/component/:component_name',
          to: 'cms_values#filter_by_page_section_and_component', as: :cms_values_page_section_component
      get 'page/:page_name/section/:section_name/component/:component_name/language/:language',
          to: 'cms_values#filter_by_page_section_component_and_language', as: :cms_values_page_section_component_language
    end
  end


  namespace :admin do
    resources :cms_values, only: [:update]
    resources :cms_values do
      get :filter, on: :collection
    end
  end
  get 'admin/cms_values/filter', to: 'admin/cms_values#filter'

  # ... and so on for other page and language combinations
end
