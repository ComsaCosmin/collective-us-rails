Rails.application.routes.draw do
  devise_for :users
  root "homes#index"

  resources :groups
  resources :group_users
end