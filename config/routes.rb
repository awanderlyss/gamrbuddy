Rails.application.routes.draw do
  # Users Routes
  devise_for :users

  resources :users, only: [:ownerships] do
    member do
      get 'ownerships'
    end
  end
  # Games Routes

  resources :games do
    member do
      post 'add_ownership'
      delete 'remove_ownership'
    end
  end

  root 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
