Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get "dashboard", to: "dashboard#home"
  resources :businesses
end
