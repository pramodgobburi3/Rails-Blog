Rails.application.routes.draw do

  namespace :admin do
      resources :posts
      resources :reported_posts
      resources :users

      root to: "posts#index"
    end
  root 'posts#index', as: 'home'

  get 'about' => 'pages#about', as: 'about'

  resources :posts do
    resources :post_comments
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :reported_posts

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'report/:id', to: 'reported_posts#report', as: 'report'


end
