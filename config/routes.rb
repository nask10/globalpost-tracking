Rails.application.routes.draw do
  devise_for :users  
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

    resource :parcels

  end

  root to: 'parcels#index'end


