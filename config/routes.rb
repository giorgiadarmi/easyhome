Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root "ads#index"
  post '/articles/:id' => 'articles#create'
  get '/' => 'mates#show'
  resources :articles
  resources :ads
  resources :mates
  
  resources :articles do
  	resources :reviews, only: [:new, :create, :destroy]
  end
end
