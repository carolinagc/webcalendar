Webcalendar::Application.routes.draw do

  root to: "events#calendar"
  resources :events
  resources :locations
  resources :organizers

  match '/signup', to: 'users#new', via:'get'

  devise_for :users
  resources :users, only: [:index]

  resources :tags, except: [:show]

  match '/calendar', to: 'events#calendar', via:'get'
end
