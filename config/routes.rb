Rails.application.routes.draw do
  namespace :api do
    get 'users/me', as: :current_user
    put 'users/:id/change_role', to: 'users#change_role', as: :user_change_role
  end

  resources :items

  devise_for :users, path: 'auth', controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions',
    invitations: 'auth/invitations',
    passwords: 'auth/passwords',
    confirmations: 'auth/confirmations',
    unlocks: 'auth/unlocks'
  }

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
