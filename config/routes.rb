Rails.application.routes.draw do
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'

  }


resources :users, except: [:index, :show, :create, :edit, :update, :new, :destroy, :delete] do
  resources :children
  resources :families
  resources :committees
  get 'add_committee' => "committees#add_user_to_committee"
end
  # resources :committees
  resources :profiles
  resources :memberships, only: [:show]
  resources :committees

  namespace :admin do
    resources :users
    resources :membership
    resources :committees
    
    get '/pending' => "membership#pending"
    get '/make_user' => "membership#make_user"
    get '/dashboard' => "application#dashboard"
    get '/make_admin' => "membership#make_admin"
    get '/former' => "membership#former"
    get '/demographics/kids' => "demographics#kids"
  end

  # resources :users do
  #   get "/" => "users#home"
  # end
  get '/users/' => "users#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'application#home'
end
