Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
  root 'layouts#home'
  get 'home/about' => 'layouts#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
