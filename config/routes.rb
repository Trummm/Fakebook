Rails.application.routes.draw do
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  get    '/logout',to: 'sessions#destroy'

  get    '/dashboard', to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resource :posts

  root to: 'sessions#new'
end