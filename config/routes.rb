Rails.application.routes.draw do

  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users do
    resources :testimonials, only: [:new, :create]
    resources :scheduled_calls, only: [:new, :create]
  end

  resources :subscriptions do
    post :cancel, :on => :collection
  end
  resources :ratings, only: :update
  resources :scheduled_calls, except: [:new, :create]

  resources :language_relationships
  resources :coaches
  resources :learners
  resources :chats do
    resources :chat_messages
  end
  resources :suggested_times do
    member do
      get 'accept'
    end
  end
end
