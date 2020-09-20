Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :users, only: [:index, :new]
  resources :items do
    resources :procedures, only: [:index, :new, :create]
    resources :comments, only: [:index, :create]
  end
end
