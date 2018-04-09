Rails.application.routes.draw do
  resources :default_settings
  resources :game_configurations
  resources :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }, skip: %i[sessions password]

  root to: 'users#index'
end
