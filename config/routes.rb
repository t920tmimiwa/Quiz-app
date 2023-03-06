Rails.application.routes.draw do
  get 'users/index'
  resources :users, except: [:show]
  root 'questions#index'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  get 'questions/:id/quiz', to: 'questions#quiz'
  get 'questions/:id/mark', to: 'questions#mark'
  get 'questions/show'
  post 'questions/mark'
  
  resources :questions
end
