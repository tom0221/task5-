Rails.application.routes.draw do
  #root to: 'top#index'
  #root 'top#index'
  root to: 'homes#top'

  devise_for :users

  get '/home/about' => 'homes#about'


  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
