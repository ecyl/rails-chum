Rails.application.routes.draw do
  get 'notifications/show'
  get 'notifications/index'
  get 'messages/create'
  get 'announcements/create'
  get 'chatroom/show'
  get 'chatroom/create'
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

    # accept and reject actions
    member do
      patch :accept
      patch :reject
    end
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :users, only: [:show]

  # resources :itinerary_users, only: --> accept/reject
end
