Rails.application.routes.draw do
  get 'events/create'
  get 'events/new'
  get 'notifications/show'
  get 'notifications/index'
  # get 'messages/create'
  get 'announcements/create'
  # get 'chatroom/show'
  # get 'chatroom/create'
  get 'itineraries/index'
  get 'itineraries/new'
  get 'itineraries/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :itineraries do
    resources :events, only: [ :new, :create, :show ]
    resources :announcements, only: [ :new, :create, :show ]
    resources :itinerary_users, only: [:new, :create]
    # #confirm method
    member do
      patch :finalise
    end
    # accept and reject actions
  end

  resources :itinerary_users, only: [] do
    member do
      patch :accept
      patch :reject
    end
  end

  # to allow users to check on all of their chatrooms
  resources :chatrooms, only: [ :index, :show, :create ] do
    resources :messages, only: :create
  end

  resources :users, only: [:show] do
    resources :chatrooms, only: :create
    resources :reviews, only: :create
  end
  # resources :itinerary_users, only: --> accept/reject
end
