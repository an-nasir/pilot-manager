# frozen_string_literal: true

Rails.application.routes.draw do
  root 'payment_requests#index'
  resources :payment_requests, except: [:index] do
    member do
      get '/accept', to: 'emp_managers#accept_payment'
      put '/reject', to: 'emp_managers#reject_payment'
    end
  end
  resources :emp_managers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
