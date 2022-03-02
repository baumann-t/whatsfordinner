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
  delete '/my-cookbook/:recipe_id', to: 'cookbooks#destroy', as: "cookbook-delete"
  get '/cookbooks/users/:user_id', to: 'cookbooks#user_cookbook', as: "user_cookbook"
  get '/users/:user_id/recipes/:id', to: 'cookbooks#show'
  get '/recipes/:id/upvotes', to: 'upvotes#create', as: "upvote_recipe"
  post '/recipes/:id/comments', to: 'comments#create', as: "comment_recipe"
  patch '/my-cookbook/:recipe_id', to: 'cookbooks#mark_cooked', as: "mark_as_cooked"
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#details'
  get '/my-wishlist', to: 'cookbook#my-wishlit', as: "my_wishlist"
end
