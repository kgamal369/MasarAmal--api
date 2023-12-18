Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :user_roles
  resources :roles
  resources :users
  resources :news_events
  resources :blog_posts
  resources :mental_services
  resources :treatment_approaches
  resources :doctors
  resources :facilities

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  ActiveAdmin.routes(self)

  if defined?(Swagger::Docs)
    Swagger::Docs::Config.register_apis(
      'v1' => {
        controller_base_path: '',
        clean_directory: true,
        api_file_path: 'public/v1/',
        base_path: "http://#{ENV['HTTP_HOST'] || 'localhost:3000'}",
      }
    )
  end
end
