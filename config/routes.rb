SettleForUs::Application.routes.draw do


  get "settle/settle"

  get "main/index"

  root :to => 'main#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  get "sessions/logout"

end
