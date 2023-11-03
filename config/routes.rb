Rails.application.routes.draw do
  #resources :userequipes
  #resources :equipes
  resources :empresas
  resources :programasetorials
  resources :agendas
  resources :planos
  resources :icps
  resources :eventos
  resources :posts
  
  get 'home/agenda'
  get 'home/academy'
  get 'home/programasetorials'
  get 'home/basesetorial'
  get 'home/radardesafios'
  get 'home/propdi'
  get 'home/feedinovacao'
  get 'home/respostapropdi'
  get 'home/respostaacademy'
  get 'home/respostafeedinovacao'
  get 'home/respostaradardesafios'
 
  get 'homea/index'
  get 'homea/users'
  #get 'homea/showusers'
  #get 'homea/edituser'
  get 'users/aedit'
  get 'users/ashowusers'
  get 'users/adicionarprogramasetorialuser'
  get 'homea/adicionareventops'
  #get 'evento/newevps'
  get 'homea/indexeventosps'

  get 'home/participarprogramasetorial'
  get 'home/participarevento'
  get 'home/profiletimeline'
  get 'home/participaracademy'

  get 'home/ctaprogramasetorial1'
  
  
  


  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  #get '/users/:user_id/users' to: 'users#show'
  #resources :users, only: [:create,:show]
  resources :users

  #match "homea/users/:id", controller: "homea", action: "update", as: "update", via: :put

  #match '*unmatched', to: 'application#not_found_method', via: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "home#feed"

  #match '*unmatched', to: 'application#not_found_method', via: :all
  #match '*unmatched', to: 'application#route_not_found', via: :all

  #get '404', :to => 'application#page_not_found'
  #get '404', :to => 'application#page_not_found_method'

    # Defines the root path route ("/")
 
  authenticated :user do
    root 'home#agenda', as: :authenticated_user_root
  end
  #authenticated :admin do
  #  root 'homea#index', as: :authenticated_admin_root
  #end

  unauthenticated do
    #root "home#index"
    root 'home#index', as: :unauthenticated_user_root
  end
end
