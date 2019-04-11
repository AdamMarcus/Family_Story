Rails.application.routes.draw do
  resources :users
  resources :stories

  get 'site/loginPage'
  get 'site/readStory'
  get 'site/writePage'
  get 'site/browse'

  get 'stories/new'
  get 'stories/show'
  # get 'stories/index'

  get 'users/new'

  root 'site#loginPage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
