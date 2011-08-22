ProjetoFinal::Application.routes.draw do
  root  :to =>  'maps#index'
  resources :user_sessions
  get "user_sessions/new"
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  resource :account, :controller => "users"
  resources :users

  get "auto_complete/maps_list"
  match '/reload_map' => 'maps#reload_map'
  resources :maps
  resources :vagas
  resources :reports

  match '/vagas/:id/coordenates' => 'vagas#coordenates'
  match '/vagas/update_coordendas/:vaga_id/:eixo_x/:eixo_y' => 'vagas#update_coordendas'

end
