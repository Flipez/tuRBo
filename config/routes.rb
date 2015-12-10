Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/admin' => 'admin#index'

  get 'welcome/index'

  root 'welcome#index'
  
  get '/about' => 'about#index'
  
  resources :articles
  post '/articles/:id' => 'comments#create'
  get '/articles/tags/:tag' => 'articles#tags'
  
  resources :categories

  resources :users

  get '/admin/users' => 'admin#user_index'
  get '/admin/users/new' => 'admin#user_new'
  post '/admin/users/new' => 'admin#user_create'

  get '/admin/articles' => 'admin#article_index'
  get '/admin/articles/new' => 'admin#article_new'
  post '/admin/articles/new' => 'admin#article_create'
  get '/admin/articles/:id' => 'admin#article_show'
  delete '/admin/articles/:id' => 'admin#article_destroy'
  get '/admin/articles/:id/edit' => 'admin#article_edit'
  post '/admin/articles/:id/edit' => 'admin#article_save'

  get '/admin/categories' => 'admin#category_index'
  get '/admin/categories/new' => 'admin#category_new'
  post '/admin/categories/new' => 'admin#category_create'
  delete '/admin/categories/:id' => 'admin#category_destroy'
  
  get '/users/:id'  => 'user#show'
  

  get 'feed' => 'articles#feed'
end
