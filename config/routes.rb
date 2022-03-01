Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/recipes/new', to: 'recipes#new'
  post '/recipes', to: 'recipes#create'
  get '/my-recipes', to: 'recipes#my_recipes'
  get '/my-cookbook', to: 'cookbooks#index'
  get '/my-cookbook/add/:recipe_id', to: 'cookbooks#add', as: "add_to_cookbook"
  post '/my-cookbook', to: 'cookbooks#create', as: "create_cookbook"
  get '/users', to: 'cookbooks#all_users'
  get '/cookbook/:user_recipe_id', to: 'cookbooks#show', as: "cookbook_recipe"
  delete '/my-cookbook/:recipe_id', to: 'cookbooks#destroy'
  get '/cookbooks/users/:user_id', to: 'cookbooks#user_cookbook', as: "user_cookbook"
  get '/users/:user_id/recipes/:id', to: 'cookbooks#show'
  get '/recipes/:id', to: 'recipes#upvote'
  post '/recipes/:id/comments', to: 'comments#create'
  patch '/my-cookbook/:recipe_id', to: 'cookbooks#mark_cooked'
  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes/:id', to: 'recipes#details'
end
