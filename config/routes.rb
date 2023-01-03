Rails.application.routes.draw do
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  get    '/logout',to: 'sessions#destroy'

  get    '/dashboard', to: 'posts#index'
  post   'follow/user', to: 'users#follow_user', as: :follow_user
  delete   'unfollow/user/:following_id', to: 'users#unfollow_user', as: :unfollow_user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show new create edit update destroy]
  resources :posts do 
    collection do 
      delete 'destroy_all_notify'
    end
  end
  resources :comments, only: %i[create destroy edit update]

  root to: 'sessions#new'
end
