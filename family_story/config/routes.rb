Rails.application.routes.draw do
  get 'site/loginPage'
  get 'site/readStory'
  get 'site/writePage'
  get 'site/browse'

  root 'site#loginPage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
