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
        get :frequency
        get :idleness
        get :vacancy
        get :analytic_pdf
        get :frequency_pdf
      end
    end
    resources :maps do
      collection do
        get :add_vacancy
      end
    end
    resources :vacancies do
      collection do
        post :update_coordenadas
      end
    end

    match '/reload_map' => 'maps#reload_map'
  end
  namespace :user do
    resources :maps, :only => [:index, :show, :update_coordenadas]
    match '/reload_map' => 'maps#reload_map'
  end
end
