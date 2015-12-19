Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  get 'welcome/index'
  root 'welcome#index'
  
  get '/about' => 'about#index'
  
  resources :articles
  post '/articles/:id' => 'comments#create'
  get '/articles/tags/:tag' => 'articles#tags'
  
  resources :categories

  resources :users
  get '/users/:id'  => 'user#show'

  namespace :admin do

    get '' => 'index#index'
    
    get 'articles' => 'articles#index'
    get 'articles/new' => 'articles#new'
    post 'articles/new' => 'articles#create'
    get 'articles/:id' => 'articles#show'
    delete 'articles/:id' => 'articles#destroy'
    get 'articles/:id/edit' => 'articles#edit'
    post 'articles/:id/edit' => 'articles#save'

    get 'users' => 'users#index'
    get 'users/new' => 'users#new'
    post 'users/new' => 'users#create'
    delete 'users/:id' => 'users#destroy'
    get 'users/:id/edit' => 'users#edit'
    post 'users/:id/edit' => 'users#save'

    get 'categories' => 'categories#index'
    get 'categories/new' => 'categories#new'
    post 'categories/new' => 'categories#create'
    delete 'categories/:id' => 'categories#destroy'
    
    get 'comments' => 'comments#index'
    delete 'comments/:id' => 'comments#destroy'
  

  end

  

  get 'feed' => 'articles#feed'
end
