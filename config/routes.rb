require 'sidekiq/web'

Rails.application.routes.draw do
  resources :backstage, only: [:index]
  namespace :backstage do
    resources :bookings, only: %i[index new edit] do
      get :create_booking
      get :delete_booking
    end
  end
  resources :meeting_rooms, only: [:index] do
    get :create_booking
    get :delete_booking
  end
  namespace :admin do
    resources :users
    resources :announcements
    resources :comments
    resources :consults
    resources :meetings
    resources :notifications
    resources :orders
    resources :services
    root to: 'users#index'
  end
  resources :consults do
    resources :orders, shallow: true
  end

  resources :meetings do
    resources :comments
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get '/backstage/analytics', to: 'backstage#analytics'
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
