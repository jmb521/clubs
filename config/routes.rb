Rails.application.routes.draw do
  
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }


  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end



resources :users, except: [:index, :show, :create, :edit, :update, :new, :destroy, :delete] do
  resources :children
  
  resources :committees
  resources :profiles
  get 'add_committee' => "committees#add_user_to_committee"
end
  # resources :committees

  resources :memberships, only: [:show]
  resources :committees
  resources :site_issues, only: [:new, :create]
  get 'resale' => "application#resale"
  get 'about_us' => "application#about_us"
  get 'membership' => "application#membership", as: "membership_info"

  # namespace :admin do
  #   resources :users
  #   resources :membership
  #   resources :committees

  #   get '/site_issues' => "site_issues#index", as: "site_issues"
  #   delete '/site_issues/:id'=> "site_issues#destroy", as: "destroy_site_issues"
  #   delete '/membership/:id' => "membership#destroy", as: "destroy_user"
  #   get '/pending' => "membership#pending"
  #   get '/make_user' => "membership#make_user"
  #   get '/dashboard' => "application#dashboard"
  #   get '/make_admin' => "membership#make_admin"
  #   get '/former' => "membership#former"
  #   get '/demographics/kids' => "demographics#kids"
  #   get '/memberspreadsheet' => "application#index"
  # end

  # resources :users do
  #   get "/" => "users#home"
  # end
  get '/users/' => "users#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'application#home'
end
