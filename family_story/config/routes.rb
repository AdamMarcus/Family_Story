Rails.application.routes.draw do
  resource :users, only: [:new, :create, :loginpage, :validatelogin, :testroute]
  resources :stories

  get 'stories/new'
  get 'stories/show'
  # get 'stories/index'

  get 'users/new'
  get 'users/loginpage'
  get 'users/validatelogin'
  get 'users/testroute'
  
  root 'users#loginpage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
