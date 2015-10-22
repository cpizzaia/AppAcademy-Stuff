Rails.application.routes.draw do
  root to: 'bands#index'
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums
  end

  resources :albums do
    resources :tracks
  end
end
