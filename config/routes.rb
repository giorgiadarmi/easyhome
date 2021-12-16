Rails.application.routes.draw do
  devise_for :users
  root "ads#index"
  
  resources :articles
  resources :ads
  resources :mates
end
