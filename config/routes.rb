Rails.application.routes.draw do
  resources :users
  root 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :questions
end
