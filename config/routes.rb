Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #all routes for articles
  resources :articles, only: [:show, :index]
end
