Rails.application.routes.draw do
  resources :users
  root 'questions#index'
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  get 'questions/quiz'
  get 'questions/:id/mark', to: 'questions#mark'
  
  resources :questions
  patch 'questions/:id', to: 'questions#update' 
end
