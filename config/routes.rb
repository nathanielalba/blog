Rails.application.routes.draw do
  devise_for :users, except: [:new, :create]
  root 'posts#index'
  resources :posts
end
