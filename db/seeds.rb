require_relative 'scraper'
require 'open-uri'

User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all

puts "creating admin account"
kieran = User.new(
  email: "admin@test.com",
  password: 123456,
  first_name: "Kieran",
  last_name: "Dunch",
  location: "Montreal"
)
puts kieran.email
puts kieran.password
kieran.save!

# ----- CREATE USER START -----
puts "Creating Sebestien"
seb = User.new(
  email: "seb@test.com",
  password: 123456,
  first_name: "Sébastien",
  last_name: "Saunier",
  location: "Paris"
)
puts seb.first_name
seb.save!

puts "Creating Thomas"
thomas = User.new(
  email: "thomas@test.com",
  password: 123456,
  first_name: "Thomas",
  last_name: "Baumann",
  location: "Montreal"
)
puts thomas.first_name
thomas.save!

puts "Creating Lea"
lea = User.new(
  email: "lea@test.com",
  password: 123456,
  first_name: "Lea",
  last_name: "Pontet",
  location: "London"
)
puts lea.first_name
lea.save!
# ----- CREATE USER END -----

# ----- CREATE RECIPE START -----

shrimp_pasta = Recipe.new(
  title: "Shrimp Pasta",
  description: "A simple yet delicious pasta with shrimps",
  ingredients: "400g of linguine, 500g of shrimps,
                1/3 cup of olive oil, 5 cloves of garlic,
                1/2 teaspoon of red pepper flakes,
                1/3 cup of dry white wine, 1/2 lemon juice,
                4 tablespoons of butter,
                1/4 chopped parsley",
  prep_time: "30 minutes",
  instructions: "Bring a large pot of salted water to a boil. Add the linguine and cook as the label directs. Reserve 1 cup cooking water, then drain.
                Season the shrimp with salt, heat the olive oil in a large skillet over medium-high heat.
                Add the garlic and red pepper flakes and cook until the garlic is just golden, 30 seconds to 1 minute.
                Add the shrimp and cook, stirring occasionally, until pink and just cooked through, 1 to 2 minutes per side.
                Remove the shrimp to a plate. Add the wine and lemon juice to the skillet and simmer until slightly reduced, 2 minutes.
                Return the shrimp and any juices from the plate to the skillet along with the linguine,
                butter and 1/2 cup of the reserved cooking water. Continue to cook, tossing, until the butter
                is melted and the shrimp is hot, about 2 minutes, adding more of the reserved cooking water as needed. Season with salt; stir in the parsley.
                Serve with lemon wedges. ",
  category: "Italian",
  serving_size: "4 servings",
  upvotes_tracker: 10
)

# Image of the recipe
image_file = URI.open('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/07/16/0/FNM_090120-Classic-Shrimp-Scampi_s4x3.jpg.rend.hgtvcom.826.620.suffix/1594915956100.jpeg')
shrimp_pasta.photo.attach(io: image_file, filename: shrimp_pasta.title, content_type: 'image/png')

# Target Lea as the author of the recipe
shrimp_pasta.user = User.where(first_name: "Lea").first

# People added this recipe to their cookbook
user_recipe = UserRecipe.new(
  user: seb, recipe: shrimp_pasta
)

# Save it
shrimp_pasta.save!
user_recipe.save!
puts shrimp_pasta.title

# Comments
comment = Comment.new(content: "This shrimp pasta is delicious, the lemon really bring the flavour together !!!!")
comment.user = User.where(id: 3).first
comment.recipe = shrimp_pasta
comment.user_recipe = user_recipe
comment.save!

# ------ Another recipe
baked_salmon = Recipe.new(
  title: "Baked Salmon",
  description: "This simple baked salmon really hits all the right notes: tangy, sweet, savory,
                a little spicy and crunchy. Cooking a larger piece makes for a nice presentation.
                Topped with buttery golden breadcrumbs and parsley,
                it's perfect for a weeknight dinner yet fancy enough to serve to guests.",
  ingredients: "2 tablespoon of brownsugar, 1/2 teaspoon of paprika, 1/2 teaspoon of garlic powder,
                1/4 teaspoon of cayenne pepper, salt, ground black pepper, 1/4 cup of panko breadcrumbs,
                1/2 cup of chopped parsley, 2 tablespoon of butter, 700g of salmon fillet, 1 tablespoon of dijon",
  prep_time: "30 minutes",
  instructions: "Preheat the oven to 425 degrees F. Line a baking sheet with foil. Mix the brown sugar, paprika,
                garlic powder, cayenne pepper, 1 teaspoon kosher salt and a generous amount of freshly ground black
                pepper in a small bowl. Mix the panko with the parsley, butter, 1/4 teaspoon kosher salt and a few
                grinds of black pepper in another small bowl. Then Place the salmon skin-side down on the prepared
                baking sheet and spread the surface with the Dijon. Press the brown sugar mixture all over the
                salmon then top with the breadcrumb mixture. Crimp all four sides of the foil to create a border
                around the salmon, this will help collect the juices so they don't spread and burn. Bake until the
                breadcrumbs are golden brown, and the salmon is firm and flakes easily when pressed, 15 to 18 minutes.
                Cut into four equal portions for serving. ",
  category: "American",
  serving_size: "4 servings",
  upvotes_tracker: 52
)
image_file = URI.open('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/12/20/0/FNK_Baked-Salmon_H_s4x3.jpg.rend.hgtvcom.826.620.suffix/1576855635102.jpeg')
baked_salmon.photo.attach(io: image_file, filename: baked_salmon.title, content_type: 'image/png')
baked_salmon.user = lea
user_recipe = UserRecipe.new(
  user: seb, recipe: baked_salmon
)
baked_salmon.save!
user_recipe.save!
puts baked_salmon.title

# ------ Another recipe
egg_sandwich = Recipe.new(
  title: "Egg Sandwich",
  description: "Simple and super fast egg sandwich.",
  ingredients: "1 tablespoon of ketchup, 1/2 teaspoon chipotle sauce,
                2 slices of bread, 2 slices of cheddar,
                1 tablespoon of butter, 1 slice of bacon, 1 egg ",
  prep_time: "20 minutes",
  instructions: "Combine the ketchup and chipotle and spread on the inside of each piece of bread.
                Place the cheese between the bread at an angle so that the edges hangover the sides of the bread.
                Butter the outside of one bread slice with half the butter. Heat a skillet over medium heat.
                Press the sandwich on, buttered-side down.
                Press until the bread is golden brown and the cheese has started to melt.
                Butter the other side (which is facing up) with the remaining butter and flip.
                Cook until golden brown and the cheese is gooey, this should all take 3 to 4 minutes.
                Remove the sandwich from the heat and hold.
                Meanwhile, in a pan over medium heat, cook the bacon until barely crisp, about 5 minutes.
                Flip the bacon, pushing the two pieces next to each other to form a square.
                Crack the egg on top, cooking into the bacon. Continue cooking until the egg is set, about 5 minutes.
                Open up the sandwich (use a spoon to help pull apart the bread) and slide in the eggs and bacon.
                Close up, slice and enjoy.",
  category: "Comfort Food",
  serving_size: "1 serving"
)

image_file = URI.open('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/11/3/2/NLV-Crave-Worthy_breakfast-sandwich_s4x3.jpg.rend.hgtvcom.826.620.suffix/1478289713133.jpeg')
egg_sandwich.photo.attach(io: image_file, filename: egg_sandwich.title, content_type: 'image/png')

# Target Thomas as the chef
egg_sandwich.user = User.where(first_name: "Thomas").first
egg_sandwich.save!

# People added this recipe to their cookbook
user_recipe = UserRecipe.new(
  user: seb, recipe: egg_sandwich
)
user_recipe.save!
puts egg_sandwich.title

# need to associate recipe id with my cookbook and mark as cooked
# seb_us = UserRecipe.new(
#   user: seb, recipe: egg_sandwich, cooked: true, date_cooked: Date.yesterday
# )
# seb_us.save!

comment = Comment.new(content: "This is the worst crap I've ever tasted!")
comment.user = User.first
comment.recipe = egg_sandwich
comment.user_recipe = user_recipe
comment.save!

# ------ Another recipe
tomato_pasta = Recipe.new(
  title: "Tomato Pasta",
  description: "This dish will always leave you satisfied! Trust me ;)",
  ingredients: "#{Faker::Food.ingredient} (#{Faker::Food.measurement}), #{Faker::Food.ingredient} (#{Faker::Food.measurement})",
  prep_time: "#{Faker::Number.between(from: 1, to: 10)} hours",
  instructions: "Cook the #{Faker::Food.ingredient} on #{['high', 'low', 'medium'].sample} for 10 minutes. Add the #{Faker::Food.spice}. Bake for #{Faker::Number.between(from: 1, to: 10)} hours. Then add #{Faker::Food.measurement} of #{Faker::Food.spice}. Prepare the #{Faker::Food.fruits} for dessert",
  category: "Italian",
  serving_size: "#{Faker::Number.between(from: 2, to: 10)} servings",
  upvotes_tracker: 11
)
image_file = scraping("Tomato Pasta")
tomato_pasta.photo.attach(io: image_file, filename: tomato_pasta.title, content_type: 'image/png')
tomato_pasta.user = kieran
user_recipe = UserRecipe.new(
  user: seb, recipe: tomato_pasta
)

comment = Comment.new(content: "This was actually pretty good!!!!")
comment.user = User.first
comment.recipe = tomato_pasta
comment.user_recipe = user_recipe
comment.save!

tomato_pasta.save!
user_recipe.save!
puts tomato_pasta.title

puts "Creating users"

20.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    password: 123456,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.city
  )

  puts user.first_name
  user.save!
end

puts "Creating recipes"
# @foods = ["Pho", "Cauliflower Penne", "Fettuccine Alfredo", "Mushroom Risotto", "Scotch Eggs", "Caprese Salad",
#           "Chicken Milanese", "Lasagne", "Katsu Curry", "Barbecue Ribs", "Chicken Fajitas", "Arepas", "Chili con Carne",
#           "Tuna Sashimi", "Fish and Chips", "Pork Sausage Roll", "Hummus", "Poutine", "California Maki",
#           "Linguine with Clams", "French Fries with Sausages", "Bruschette with Tomato", "Pork Belly Buns",
#           "French Toast", "Souvlaki", "Pierogi", "Pasta and Beans", "Salmon Nigiri", "Bunny Chow", "Peking Duck",
#           "Pizza", "Kebab", "Cheeseburger", "Ebiten maki"]

@foods = ["Pho", "Cauliflower Penne", "Fettuccine Alfredo", "Mushroom Risotto", "Scotch Eggs", "Caprese Salad"]

@foods.each do |food|
  recipe = Recipe.new(
    title: food,
    description: Faker::Food.description,
    ingredients: "#{Faker::Food.ingredient} (#{Faker::Food.measurement}), #{Faker::Food.ingredient} (#{Faker::Food.measurement})",
    prep_time: "#{Faker::Number.between(from: 1, to: 10)} hours",
    instructions: "Cook the #{Faker::Food.ingredient} on #{["high", "low", "medium"].sample} for 10 minutes. Add the #{Faker::Food.spice}. Bake for #{Faker::Number.between(from: 1, to: 10)} hours. Then add #{Faker::Food.measurement} of #{Faker::Food.spice}. Prepare the #{Faker::Food.fruits} for dessert",
    category: Faker::Food.ethnic_category,
    serving_size: "#{Faker::Number.between(from: 2, to: 10)} servings"
  )

  image_file = scraping(food)
  recipe.photo.attach(io: image_file, filename: recipe.title, content_type: 'image/png')
  user = User.all.sample
  recipe.user = user
  user_recipe = UserRecipe.new(
    user: user, recipe: recipe
  )
  recipe.save!
  user_recipe.save!
  puts recipe.title
end

puts "creating user recipes..."

10.times do
  user = User.all.sample
  recipe = Recipe.all.to_a.sample
  user_recipe = UserRecipe.new(
    cooked: [false, true].sample,
    date_cooked: Faker::Date.in_date_period(year: 2018, month: 2),
    wishlisted: [false, true].sample,
    user_comment: ["Wow so good!", "Still have to try this one!", "I eat this at least once a week",
                   "Easy recipe for week night dinner"].sample
  )
  user_recipe.user = user
  user_recipe.recipe = recipe
  user_recipe.save!
end

# puts "creating upvotes and comments"
# 20.times do
#   user = User.all.sample
#   recipe = Recipe.all.sample
#   content = ["So nice!", "I'll try that next week!", "Added to my cookbook right away!", "Are you sure we need that much sugar?", "Can I replace the wine with beef stock?", "You should go to Top Chef!"].sample

#   comment = Comment.new(content: content)
#   comment.user = user
#   comment.recipe = recipe
#   comment.user_recipe = user_recipe
#   comment.save!

#   upvote = Upvote.new
#   upvote.user = user
#   upvote.recipe = recipe
#   upvote.save!
# end
puts "creating upvotes and comments"
20.times do
  user = User.all.sample
  recipe = Recipe.all.sample

  # guard clause
  # Check if there's already an upvote from this user to that recipe
  unless recipe.upvotes.pluck(:user_id).include?(user.id)
    content = ["So nice!", "I'll try that next week!", "Added to my cookbook right away!", "Are you sure we need that much sugar?", "Can I replace the wine with beef stock?", "You should go to Top Chef!"].sample

    comment = Comment.new(content: content)
    comment.user = user
    comment.recipe = recipe
    comment.user_recipe = user_recipe
    comment.save!

    upvote = Upvote.new
    upvote.user = user
    upvote.recipe = recipe
    upvote.save!
  end

end
