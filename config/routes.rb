Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'singup', to: 'users#new'
  resources :users, excep: [:new]
end
