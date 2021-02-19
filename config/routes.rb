Rails.application.routes.draw do
  devise_for :users

  get 'search', to: "tasks#search"

  resources :tasks
  
  root to: "tasks#index"
  
end
