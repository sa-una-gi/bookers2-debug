Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships,only: [:create,:destroy]
    get '/follow' => 'relationships#follow'
    get '/follower' => 'relationships#follower'
    get '/room/:id' => 'chats#show'
    post '/room/:id' => 'chats#create'
  end
  root to: 'home#top'
  get 'home/about' => 'home#about'
  get '/search' => 'search#search'
  resources :books do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end
end