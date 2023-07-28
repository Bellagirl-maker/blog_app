Rails.application.routes.draw do
  root 'users#index'
  
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create'

  resources :users, only: [:show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resource :like, only: [:create, :destroy], controller: 'likes'
    end
  end
end
