Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#search'
  get '/recipes/new', to: 'recipes#new'
  post '/recipes', to: 'recipes#create'
  get '/my-recipes', to: 'recipes#my_recipes'
  get '/my-cookbook', to: 'cookbooks#index'
  get '/my-cookbook/top-10', to: 'cookbooks#top_ten', as: "my_top_ten"
  get '/my-cookbook/add/:recipe_id', to: 'cookbooks#add', as: "add_to_cookbook"
  post '/my-cookbook', to: 'cookbooks#create', as: "create_cookbook"
  get '/my-cookbook/history', to: 'cookbooks#my_history', as: "my_cookbook_history"
  get '/users', to: 'cookbooks#user_search'
  get '/cookbook/:user_recipe_id', to: 'cookbooks#show', as: "cookbook_recipe"
  delete '/my-cookbook/:recipe_id', to: 'cookbooks#destroy', as: "cookbook-delete"
  get '/cookbooks/users/:user_id', to: 'cookbooks#user_cookbook', as: "user_cookbook"
  get '/cookbooks/users/:user_id/top-10', to: 'cookbooks#top_ten', as: "user_top_ten"
  get '/users/:user_id/recipes/:id', to: 'cookbooks#show'
  get '/recipes/:id/upvotes', to: 'upvotes#create', as: "upvote_recipe"
  post '/cookbook/:user_recipe/comments', to: 'comments#create', as: "comment_recipe"
  patch '/my-cookbook/:recipe_id', to: 'cookbooks#mark_cooked', as: "mark_as_cooked"
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes', to: 'recipes#search'
  get '/recipes/:id', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#details'
  get '/my-wishlist', to: 'cookbooks#my_wishlist', as: "my_wishlist"
  get '/my-wishlist/add', to: 'cookbooks#add_wishlist'
end
