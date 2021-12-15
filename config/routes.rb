Rails.application.routes.draw do
  devise_for :users
  root "ads#index"
  
  resources :ads
  resources :mates
end
