Rails.application.routes.draw do
  # Route for all users page
  get '/users', to: 'users#index', as: 'users'

  # Route for single user page
  get '/users/:id', to: 'users#show', as: 'user'

  # Route for all posts by a given user page
  get '/users/:user_id/posts', to: 'posts#index', as: 'user_posts'

  # Route for single post page
  get '/posts/:id', to: 'posts#show', as: 'user_post'

end
