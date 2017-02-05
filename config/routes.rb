Rails.application.routes.draw do
  # Users Routes
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    member do
      get 'ownerships'
    end
    member do
      resource :profile
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
