ProjetoFinal::Application.routes.draw do
  root  :to =>  'home#index'
  resources :user_sessions
  get "user_sessions/new"
  match 'login' => "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  resource :account, :controller => "users"
  resources :users

  get "auto_complete/maps_list"
  
  scope :module => :admin do
    resources :status_controlls, :as => :reports, :only => [:index] do
      collection do
        get :analytic
        get :search
        get :vacancy
        get :daily
        #get :make_pdf
        #get :make_csv
      end
    end
    resources :vacancies
    resources :maps
    match '/reload_map' => 'maps#reload_map'
    match '/vacancies/:id/coordenates' => 'vacancies#coordenates'
    match '/vacancies/update_coordendas/:vacancy_id/:eixo_x/:eixo_y' => 'vacancies#update_coordendas'
  end
  namespace :user do
    resources :maps, :only => [:index, :show, :update_coordenadas]
    match '/reload_map' => 'maps#reload_map'
  end
end
