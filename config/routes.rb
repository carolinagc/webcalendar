Webcalendar::Application.routes.draw do

  root to: "events#calendar"
  resources :events
  resources :locations
  resources :organizers
  devise_for :users
  resources :users
  match '/signup', to: 'users#new', via:'get'
  match '/signin', to: 'devise/sessions#new', via: 'get'
  match '/signout', to: 'devise/sessions#new', via:'delete'
  resources :tags, except: [:show]

  match '/calendar', to: 'events#calendar', via:'get'
end
