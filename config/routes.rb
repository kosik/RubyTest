Rails.application.routes.draw do
  get 'home/index'
  get 'home/new'
  post '/home/create'
  get 'shorturl/:id', to: 'shorturl#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
