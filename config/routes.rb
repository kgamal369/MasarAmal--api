Rails.application.routes.draw do
  resources :user_roles
  resources :roles
  resources :users
  resources :news_events
  resources :blog_posts
  resources :mental_services
  resources :treatment_approaches
  resources :doctors
  resources :facilities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
