Rails.application.routes.draw do
  # get 'contents/index'
  # get 'contents/show'
  # get 'contents/new'
  # get 'contents/edit'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'home/index'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :contents
end
