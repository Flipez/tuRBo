Rails.application.routes.draw do
  get 'admin/index'

  get 'welcome/index'

  root 'welcome#index'
  
  get '/about' => 'about#index'
  
  resources :articles
  resources :categories
  resources :users
end
