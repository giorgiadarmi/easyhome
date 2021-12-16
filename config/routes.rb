Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users
  root "ads#index"
  post '/articles/:id' => 'articles#create'
  get '/' => 'mates#show'
  resources :articles
  resources :ads
  resources :mates
  
  resources :articles do
  	put :favorite, on: :member
  	resources :comments, only: [:new, :create, :destroy]
  end
end
