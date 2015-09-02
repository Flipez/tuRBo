Rails.application.routes.draw do
  get 'admin/index'

  get 'welcome/index'

  
  root 'welcome#index'
  
  resources :articles
  resources :categories
end
