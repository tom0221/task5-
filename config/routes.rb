Rails.application.routes.draw do
  #root to: 'top#index'
  #root 'top#index'
  root to: 'homes#top'

  devise_for :users

  get '/home/about' => 'homes#about'

  resources :users, only: [:create, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resource :book_comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
