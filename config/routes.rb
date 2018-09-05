Rails.application.routes.draw do

resources :users do
  resources :children, only: [:index, :edit, :new, :create, :destroy]
  resources :families

end
  resources :profiles
  resources :memberships


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
