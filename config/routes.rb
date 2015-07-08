Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :users do
    resources :testimonials, only: [:new, :create]
  end

  resources :ratings, only: :update

  resources :language_relationships
  resources :coaches
  resources :learners
  resources :chats do
    resources :chat_messages
  end
end
