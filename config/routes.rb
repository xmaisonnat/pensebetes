Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :reservations, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals, only: [:index, :show, :new, :create, :destroy] do
    resources :reservations, only: [:create] do
      member do
        patch 'accept'
        patch 'decline'
      end
    end
  end
  namespace :owners do
    resources :reservations
  end
end
