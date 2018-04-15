Rails.application.routes.draw do
  get "sign_up" => "users/registrations#new"
  get "sign_in" => "users/sessions#new"
  delete "sign_out" => "users/sessions#destroy"
  namespace :users do
    resources :registrations, only: :create
    resources :sessions, only: :create
  end
end
