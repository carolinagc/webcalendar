Webcalendar::Application.routes.draw do

  root to: "events#index"
  resources :events
  resources :locations
  resources :organizers

end
