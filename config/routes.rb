Rails.application.routes.draw do
    #require "admin_constraint"
    require 'sidekiq/web'

    #constraints lambda {|request| AuthConstraint.admin?(request) } do
    mount Sidekiq::Web => '/admin/sidekiq'


  devise_for :users, controllers: {
    registrations: 'registrations',
    passwords: 'users/passwords'
  }  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :parcels
  end

  resources :parcels do
    member do
      get 'update_status' => 'parcels#update_status', as: 'update_parcel_status'
    end
  end

  namespace :api do
    resources :parcels
    resources :users
  end

  root to: 'parcels#index'end


