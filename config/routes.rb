Rails.application.routes.draw do
  get '/mail_reset_password',   to: 'password#new'
  post '/mail_reset_password',   to: 'password#mail_reset'
  get '/reset_password',    to: 'password#reset'
  post '/reset_password',   to: 'password#reset_password'
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
  resources :courses 
  resources :grades
  resources :feedbacks

end
