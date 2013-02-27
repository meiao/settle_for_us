SettleForUs::Application.routes.draw do


  match "settle", to: 'settle#settle', format: false
  match "settle/try_again", to: 'settle#try_again', format: false

  get "main/index"
  get "main/help"

  root :to => 'main#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  get "sessions/logout"

end
