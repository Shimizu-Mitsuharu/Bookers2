Rails.application.routes.draw do
  root 'layouts#home'
  get 'layouts/about' => 'home/about'
  devise_for :users
  resources :books
  resources :users,only: [:show,:index,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
