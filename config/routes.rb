Webcalendar::Application.routes.draw do

  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :calendars
    root to: redirect("/%{locale}/calendars")
    resources :events
    resources :locations
    resources :organizers
    devise_for :users
    resources :users, only: [:index]
    resources :tags, except: [:show]
  end

end
