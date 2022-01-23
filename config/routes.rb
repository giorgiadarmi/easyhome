Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'users/favorites'

  
  root 'ads#index'
  post '/articles/:id' => 'articles#create'
  get '/contacts/show' =>'contacts#show'
  post '/ads/:id' => 'ads#create'
  get '/search', to: 'articles#search'
  post '/articles/:id' => 'articles#show'
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

  #Admin Actions
get '/adm', to: 'admins#index', :as => :admin_view
get '/adm/ban/:id', to: 'admins#ban_user', :via => :get, :as => :admin_ban_user
get '/adm/unban/:id', to: 'admins#unban_user', :via => :get, :as => :admin_unban_user
get '/adm/admin/:id', to: 'admins#admin_user', :via => :get, :as => :admin_admin_user
get '/adm/unadmin/:id', to: 'admins#unadmin_user', :via => :get, :as => :admin_unadmin_user


end
