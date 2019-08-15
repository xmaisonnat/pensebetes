Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :reservations, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :animals, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:create]
  end
  namespace :owners do
    resources :reservations do
      member do
        patch 'accept'
        patch 'decline'
      end
    end
  end
end
