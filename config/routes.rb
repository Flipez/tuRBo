Rails.application.routes.draw do

  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get '/about' => 'about#index'

  get 'welcome/index'
  root 'welcome#index'
  
 
  get 'albums/new' => 'album#new'
  post 'albums/new' => 'album#create'

  get 'articles/:id' => 'articles#show', as: :article 
  post 'articles/:id' => 'comments#create'
  get 'articles/tags/:tag' => 'articles#tags'
  
  get 'categories/:id' => 'categories#show', as: :category

  get 'users' => 'users#index'
  get 'users/:id'  => 'users#show', as: :user

  namespace :admin do

    get '' => 'index#index'
    
    get 'articles' => 'articles#index'
    get 'articles/new' => 'articles#new'
    get 'articles/:id' => 'articles#show'
    delete 'articles/:id' => 'articles#destroy'
    get 'articles/:id/edit' => 'articles#edit'
    post 'articles/new' => 'articles#create'
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
 
    get 'settings' => 'settings#index'
    post 'settings' => 'settings#save'
    post 'settings/add_url' => 'settings#add_url'

  end

  

  get 'feed' => 'articles#feed'
end
