Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'posts#index'

  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]

    get :search, on: :collection
  end
  resources :users, only: [:show, :edit, :update]

end
