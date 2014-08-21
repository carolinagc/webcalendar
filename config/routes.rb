Webcalendar::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  	root to: redirect("/%{locale}/calendar")
    get "/calendar", to: "events#calendar", as: :calendar
    resources :events
    resources :locations
    resources :organizers
    devise_for :users
    resources :users, only: [:index]
    resources :tags, except: [:show]
  end

end
