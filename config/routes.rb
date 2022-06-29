# frozen_string_literal: true

Rails.application.routes.draw do
  root 'payment_requests#index'
  resources :payment_requests, except: [:index] do
    member do
      # I would have used PUT instead of GET but my jQuery wasn't working
      # And I didn't want it to be through forms
      get '/accept', to: 'emp_managers#accept_payment'
      get '/reject', to: 'emp_managers#reject_payment'
    end
  end
  resources :emp_managers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
