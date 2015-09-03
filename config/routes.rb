Rails.application.routes.draw do
  get '/admin' => 'admin#index'

  get 'welcome/index'

  root 'welcome#index'
  
  get '/about' => 'about#index'
  
  resources :articles
  resources :categories

  resources :users

  get '/admin/users' => 'admin#user_index'
  get '/admin/users/new' => 'admin#user_new'
  post '/admin/users/new' => 'admin#user_create'

  get '/admin/users/:id' => 'admin#user_show'
end
