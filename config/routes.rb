Rails.application.routes.draw do
  root 'info#home'
  get 'info/home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
