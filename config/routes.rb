SettleForUs::Application.routes.draw do


  match "settle", to: 'settle#settle', format: false
  match "settle/try_again", to: 'settle#try_again', format: false

  get "favorites", to: 'favorites#list'
  get "favorites/settle", to: 'favorites#settle'
  get "favorites/search/:name", to:'favorites#search'
  get "favorites/add/:venue", to: 'favorites#add'
  get "favorites/remove/:venue", to: 'favorites#remove'
  
  get "main/index"
  get "main/help"

  root :to => 'main#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  get "sessions/logout"

end
