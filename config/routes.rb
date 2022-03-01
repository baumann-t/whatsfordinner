Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/recipes/new', to: 'recipes#new'
  post '/recipes', to: 'recipes#create'
  get '/my-recipes', to: 'recipes#my_recipes'
  get '/my-cookbook', to: 'cookbooks#index'
  post '/my-cookbook', to: 'cookbooks#create'
  get '/my-cookbook/:recipe_id', to: 'cookbooks#show'
  delete '/my-cookbook/:recipe_id', to: 'cookbooks#destroy', as: "mycookbook_recipe"
  get '/cookbooks/users/:user_id', to: 'cookbooks#user_cookbook'
  get '/users/:user_id/recipes/:id', to: 'cookbooks#show'
  get '/recipes/:id', to: 'recipes#upvote'
  post '/recipes/:id/comments', to: 'comments#create'
  patch '/my-cookbook/:recipe_id', to: 'cookbooks#mark_cooked'
  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show'
  get '/recipes/:id', to: 'recipes#details'
end
