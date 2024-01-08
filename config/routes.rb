Rails.application.routes.draw do
  devise_for :users
  resources :banks
  resources :providers
  get :dashboard, controller: :dashboard, action: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
