Rails.application.routes.draw do
  resources :scheduled_calls

  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users do
    resources :testimonials, only: [:new, :create]
  end

  resources :subscriptions do
    post :cancel, :on => :collection
  end
  resources :ratings, only: :update

  resources :language_relationships
  resources :coaches
  resources :learners
  resources :chats do
    resources :chat_messages
  end
end
