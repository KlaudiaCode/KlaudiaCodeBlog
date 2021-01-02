Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles #, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  get 'signup', to: 'users#new'
  resources :users, exept: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'gallery', to: 'articles#gallery'
end
