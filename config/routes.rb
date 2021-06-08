Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  resources :bookings,  only: [:new, :create, :show, :update, :destroy, :edit] do
      resources :reviews, only: [:create, :new]
  end
  resources :slots, only: [:new, :create, :update, :destroy, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
