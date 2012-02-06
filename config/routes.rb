ProjetoFinal::Application.routes.draw do
  root  :to =>  'home#index'
  resources :user_sessions
  get "user_sessions/new"
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  resource :account, :controller => "users"
  resources :users

  get "auto_complete/maps_list"
  match '/reload_map' => 'maps#reload_map'
  resources :maps
  resources :vacancies
  resources :status_controlls, :as => :reports, :only => [:analytic, :search] do
    collection do
      get :analytic
      get :search
      get :make_pdf
      get :vacancy
      get :make_csv
    end
  end

  match '/vacancies/:id/coordenates' => 'vacancies#coordenates'
  match '/vacancies/update_coordendas/:vacancy_id/:eixo_x/:eixo_y' => 'vacancies#update_coordendas'

end
