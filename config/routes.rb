Rails.application.routes.draw do
  get 'artists', to: 'artists#index', as: 'artists'
  get 'artists/:id', to: 'artists#show', as: 'artist'
  devise_for :users
  resources :albums
  root to: 'artists#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
