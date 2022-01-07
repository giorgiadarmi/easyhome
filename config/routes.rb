Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'users/favorites'
  
  root 'ads#index'
  post '/articles/:id' => 'articles#create'
  
  get '/search', to: 'articles#search'
  get '/' => 'mates#show'
  get '/users/comments/:id', to: 'comments#user_comments', :as => :user_comments
  resources :articles
  resources :ads
  resources :users
  resources :services
  
  resources :articles do
  	resources :comments, only: [:new, :create, :destroy]
  end
  
  resources :ads do
  	put :favorite, on: :member
  end
  

end
