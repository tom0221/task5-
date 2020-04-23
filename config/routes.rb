Rails.application.routes.draw do
  #root to: 'top#index'
  #root 'top#index'
  root to: 'homes#top'

  devise_for :users

  get '/home/about' => 'homes#about'

  get 'users/follower' => 'users#show_follow'
  get 'users/followed' => 'users#show_follower'



  resources :users, only: [:create, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resource :book_comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  resources :relationships, only: [:create, :destroy]

  post 'follow/:id' => 'relationships#create', as: 'follow' #フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' #フォローしない
  
end

