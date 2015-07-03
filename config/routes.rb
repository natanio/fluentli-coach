Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :language_relationships
  resources :coaches
  resources :learners
end
