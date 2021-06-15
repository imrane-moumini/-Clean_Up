Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/bookings/:id/recap', to: 'bookings#recap', as: :recap
  resources :bookings,  only: [:new, :create, :show, :destroy] do
      resources :reviews, only: [:create, :new]
  end
  resources :slots, only: [:new, :create, :update, :destroy, :edit]
  resources :chatrooms, only: :show do
    resources :messages, only: [:create, :destroy]
end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
