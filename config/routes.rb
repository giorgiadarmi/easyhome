Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'users/favorites'

  
  root 'ads#index'
  post '/articles/:id' => 'articles#create'
  get '/contacts/show' =>'contacts#show'
  post '/ads/:id' => 'articles#create'
  get '/search', to: 'articles#search'
  get '/' => 'users#show'
  get '/users/comments/:id', to: 'comments#user_comments', :as => :user_comments
  resources :articles
  resources :ads
  resources :users
  resources :services
  resources :contacts
  resources :contacts, only: [:create]
  resources :ads do
    resources :favorites
  end
  resources :articles do
  	resources :comments, only: [:new, :create, :destroy]
  end

  resources :articles do
    resources :likes
  end



end
