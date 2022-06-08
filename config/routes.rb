Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :itineraries do
    resources :events, only: [ :new, :create, :show ]
    resources :announcements, only: [ :new, :create, :show ]
    resources :itinerary_users, only: [:create]
    # #confirm method
  end

  resources :chatrooms do
    resources :messages
  end

  resources :users, only: [:show]


  # resources :itinerary_users, only: --> accept/reject
end
