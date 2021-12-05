Rails.application.routes.draw do
  get 'teams/new'
  get 'teams/edit'
  get 'teams/delete'
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :teams
  resources :projects
  resources :courses do
    resources :projects
  end
  resources :feedbacks

end
