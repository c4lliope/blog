Rails.application.routes.draw do
  resources :posts
  resources :interests, only: [:create]

  root to: "posts#index"
end
