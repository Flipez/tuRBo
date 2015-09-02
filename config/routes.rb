Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'
  
  get '/about' => 'about#index'
  
  resources :articles
  resources :categories
  resources :users
end
