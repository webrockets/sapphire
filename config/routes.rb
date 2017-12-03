Rails.application.routes.draw do
  resources :users
  resources :items
  devise_for :users, path: 'auth', controllers: {
    registrations: 'auth/registrations', sessions: 'auth/sessions', invitations: 'auth/invitations', passwords: 'auth/passwords'
  }

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
