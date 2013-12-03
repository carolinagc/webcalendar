Webcalendar::Application.routes.draw do

  root to: "events#index"
  resources :events
  resources :locations
  resources :organizers
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup', to: 'users#new', via:'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via:'delete'

end
