Rails.application.routes.draw do
  resource :users, only: [:new, :create, :loginpage, :validatelogin]
  resources :stories

  get 'site/loginpage'
  get 'site/readStory'
  get 'site/writePage'
  get 'site/browse'

  get 'stories/new'
  get 'stories/show'
  # get 'stories/index'

  get 'users/new'
  get 'users/loginpage'
  get 'users/validatelogin'

  root 'users#loginpage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
