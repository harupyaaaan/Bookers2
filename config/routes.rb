Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/home/about' => 'homes#about'
  resources :books
  delete 'books/:id' => 'books#destroy', as:'destroy_book'


end
