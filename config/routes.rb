Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :reservations, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals, only: [:index, :show, :new, :create]
  resources :reservations do
    member do
      patch 'accept'
      patch 'decline'
    end
    collection do
      get 'owner_index'
    end
  end
end
