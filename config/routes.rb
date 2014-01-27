Webcalendar::Application.routes.draw do
  get '/:locale' => 'events#index'
  root to: "events#calendar"
  scope "/:locale" do
    resources :events
    resources :locations
    resources :organizers
  end
  resources :events
  resources :locations
  resources :organizers

  match '/signup', to: 'users#new', via:'get'

  devise_for :users
  resources :users, only: [:index]

  resources :tags, except: [:show]

  match '/calendar', to: 'events#calendar', via:'get'
end
