Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :reservations, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :animals, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:create]
  end
  resources :reservations do
    member do
      patch 'accept'
      patch 'decline'
    end
    collection do
      get 'owner_index'
=======
  resources :animals, only: [:index, :show, :new, :create]

  Rails.application.routes.draw do
    namespace :owners do
      resources :reservations do
        member do
          patch 'accept'
          patch 'decline'
        end
      end
>>>>>>> 41678b6cc9cdb37cf4d67fb5093e7f74843cf49f
    end
  end
end
