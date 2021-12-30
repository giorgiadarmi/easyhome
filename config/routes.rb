Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  
  root 'ads#index'
  post '/articles/:id' => 'articles#create'
  
  get '/search', to: 'articles#search'
  get '/' => 'mates#show'
  get '/users/comments/:id', to: 'comments#user_comments', :as => :user_comments
  resources :articles
  resources :ads
  resources :mates
  
  resources :articles do
  	resources :comments, only: [:new, :create, :destroy]
  end
  

end
