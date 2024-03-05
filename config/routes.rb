Rails.application.routes.draw do
  devise_for :users

  resources :blog_posts

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index" 
end
