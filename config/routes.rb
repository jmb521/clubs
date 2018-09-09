Rails.application.routes.draw do
  resources :committees
  devise_for :users, controllers: {
    sessions: 'users/sessions'

  }


resources :users, except: [:index, :show, :create, :edit, :update, :new, :destroy] do
  resources :children
  resources :families
  resources :committees

end
  # resources :committees
  resources :profiles
  resources :memberships, only: [:show]

  namespace :admin do
    resources :users
    resources :membership
    resources :committees
    get '/pending' => "membership#pending"
    get '/make_user' => "membership#make_user"
    get '/dashboard' => "application#dashboard"
    get '/make_admin' => "membership#make_admin"
    get '/former' => "membership#former"
  end

  # resources :users do
  #   get "/" => "users#home"
  # end
  get '/users/' => "users#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'application#home'
end
