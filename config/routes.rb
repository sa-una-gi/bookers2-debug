Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  root to: 'home#top'
  get 'home/about' => 'home#about'

  resources :books do
    resource :favorites,only: [:create,:destroy]
  end
end