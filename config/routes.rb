Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'about', to: 'pages#about'
  get '/articles', to: 'articles#new', as: 'article'
  get '/articles/:id(.:format)', to: 'articles#show', as: 'show'
  get '/index', to: 'articles#index', as: 'index'
  resources :articles
end
