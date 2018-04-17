Rails.application.routes.draw do
  get "sign_up" => "user/registrations#new"
  get "sign_in" => "user/sessions#new"
  delete "sign_out" => "user/sessions#destroy"
  namespace :user do
    resources :registrations, only: :create
    resources :sessions, only: :create
  end
  root :to => "top#index"
end
