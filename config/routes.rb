Rails.application.routes.draw do

  resources :profiles
  resources :memberships
  resources :children
  resources :families
  devise_for :users, controllers: {
      sessions: 'users/sessions'

    }
  # resources :users do
  #   get "/" => "users#home"
  # end
  get '/users/' => "users#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'application#home'
end
