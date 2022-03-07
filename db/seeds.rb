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
<<<<<<< HEAD
puts user.first_name
user.save!

recipe = Recipe.new(
  title: "Best Egg Sandwich",
  description: "The best egg sandwich ever.",
  ingredients: "#{Faker::Food.ingredient} (#{Faker::Food.measurement}), #{Faker::Food.ingredient} (#{Faker::Food.measurement})",
  prep_time: "#{Faker::Number.between(from: 1, to: 10)} hours",
  instructions: "Cook the #{Faker::Food.ingredient} on #{['high', 'low', 'medium'].sample} for 10 minutes. Add the #{Faker::Food.spice}. Bake for #{Faker::Number.between(from: 1, to: 10)} hours. Then add #{Faker::Food.measurement} of #{Faker::Food.spice}. Prepare the #{Faker::Food.fruits} for dessert",
  category: "Comfort Food",
  serving_size: "#{Faker::Number.between(from: 2, to: 10)} servings"
)
image_file = scraping("Egg Sandwich")
recipe.photo.attach(io: image_file, filename: recipe.title, content_type: 'image/png')
recipe.user = user
user_recipe = UserRecipe.new(
  user: user, recipe: recipe
)

# need to associate recipe id with my cookbook and mark as cooked
seb_us = UserRecipe.new(
  user: seb, recipe: recipe, cooked: true, date_cooked: Date.yesterday
)
seb_us.save!

#  Adding comment from Kieran

recipe.save!
user_recipe.save!
puts recipe.title

# need to make thomas baumann who made pasta dish

puts "Creating Thomas"
user = User.new(
  email: "thomas@test.com",
  password: 123456,
  first_name: "Chef",
  last_name: "Thomas",
  location: "Montreal"
)
puts user.first_name
user.save!

recipe = Recipe.new(
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
recipe.photo.attach(io: image_file, filename: recipe.title, content_type: 'image/png')
recipe.user = user
user_recipe = UserRecipe.new(
  user: user, recipe: recipe
)



recipe.save!
user_recipe.save!
puts recipe.title
=======
puts lea.first_name
lea.save!
>>>>>>> master

puts "Creating users"

10.times do
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

huang = User.new(
  email: "huang@whats4dinner.app",
  password: 123456,
  first_name: "Huang",
  last_name: "Shewei",
  location: "Montreal"
)

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
comment.user = User.where(first_name: "Kieran").first
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

comment = Comment.new(content: "This is the worst crap I've ever tasted!")
comment.user = User.first
comment.recipe = egg_sandwich
comment.user_recipe = user_recipe
comment.save!

# ------ Another recipe
tomato_pasta = Recipe.new(
  title: "Tomato Pasta",
  description: "This dish will always leave you satisfied! Trust me ;)",
  ingredients: "500g penne, 2 tablespoon of olive oil, 1 small onion, 2 garlic cloves, salt to taste,
                ground black pepper to taste, 1 can crushed tomatoes, 1/2 cup of heavy cream, 1/2 cup of basil leaves,
                grated parmesan to taste",
  prep_time: "35 minutes",
  instructions: "Heat olive oil in a large, high-sided sauté pan over medium heat until shimmering.
                Add the onion and sauté until softened and translucent, 3 to 4 minutes.
                Add the garlic and red pepper flakes, if using, and sauté until fragrant, 30 seconds to 1 minute.
                Carefully pour in the crushed tomatoes. Add the salt and pepper and stir to combine.
                Bring to a simmer and cook, uncovered, stirring occasionally, for 10 minutes.
                Reduce heat to low and stir in the cream. Taste and season with additional salt and pepper as needed.
                Meanwhile, bring a large pot of salted water to a boil. Add the pasta and cook al dente, about
                10 minutes or according to package instructions. Drain the pasta and add it to the sauce. Toss gently to
                combine. Add the basil, toss once more, and serve immediately with grated cheese.",
  category: "Italian",
  serving_size: "4 to 6 servings",
  upvotes_tracker: 11
)
image_file = URI.open('https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_center,w_1460,h_1825/k%2Farchive%2F0eb929bc2c007ebf6009316a327b1e37587045a4')
tomato_pasta.photo.attach(io: image_file, filename: tomato_pasta.title, content_type: 'image/png')
tomato_pasta.user = kieran
tomato_pasta.save!
user_recipe = UserRecipe.new(
  user: seb, recipe: tomato_pasta
)
user_recipe.save!

comment = Comment.new(content: "This was actually pretty good!!!!")
comment.user = seb
comment.recipe = tomato_pasta
comment.user_recipe = user_recipe
comment.save!

puts tomato_pasta.title

# Another recipe

garlic_butter_steak = Recipe.new(
  title: "Garlic butter steak",
  description: "Delicious butter steak perfect for dinner.",
  ingredients: "1 ribeye steak, salt to taste, ground black pepper to taste,
                3 tablespoon canola oil, 3 tablespoon of butter, 3 cloves of garlic,
                2 sprigs fresh thyme",
  prep_time: "1 hour",
  instructions: "Preheat oven to 200°F (95°C). Generously season all sides of the steak with salt and pepper.
                Transfer to a wire rack on top of a baking sheet, then bake for about 45 minutes to an hour until the
                internal temperature reads about 125°F (51° C) for medium-rare. Adjust the bake time based on if you
                like your steak more rare or more well-done. Heat the canola oil in a pan over high heat until smoking.
                Do not use olive oil, as its smoke point is significantly lower than that of canola oil and will smoke
                before reaching the desired cooking temperature. Sear the steak for 30 seconds on the first side,
                then flip. Add the butter, garlic, rosemary, and thyme and swirl around the pan. Transfer the garlic
                and herbs on top of the steak and baste the steak with the butter using a large spoon. Baste for about
                30 seconds, then flip and baste the other side for about 15 seconds. Turn the steak on its side and cook
                to render off any excess fat. Rest the steak on a cutting board or wire rack for about 10 minutes.
                Slicing the steak before the resting period has finished will result in a lot of the juices leaking out,
                which may not be desirable.
                Slice the steak into ½ -inch (1 cm) strips, then fan out the slices and serve.",
  category: "American",
  serving_size: "2",
  upvotes_tracker: 4
)
image_file = URI.open('https://www.eatwell101.com/wp-content/uploads/2020/10/Garlic-Butter-Steak-recipe-roasted-in-Oven.jpg')
garlic_butter_steak.photo.attach(io: image_file, filename: garlic_butter_steak, content_type: 'image/png')
garlic_butter_steak.user = huang
garlic_butter_steak.save!

user_recipe = UserRecipe.new(
  user: huang, recipe: garlic_butter_steak
)
user_recipe.save!
puts garlic_butter_steak.title

# need to associate recipe id with my cookbook and mark as cooked

comment = Comment.new(content: "This is so delicious! I cook it every day")
comment.user = lea
comment.recipe = garlic_butter_steak
comment.user_recipe = user_recipe
comment.save!

<<<<<<< HEAD
# puts "creating upvotes and comments"
# 50.times do
#   user = User.all.sample
#   recipe = Recipe.all.sample
#   content = ["So nice!", "I'll try that next week!", "Added to my cookbook right away!", "Are you sure we need that much sugar?", "Can I replace the wine with beef stock?", "You should go to Top Chef!"].sample

#   comment = Comment.new(content: content)
#   comment.user = user
#   comment.recipe = recipe
#   comment.save!

#   upvote = Upvote.new
#   upvote.user = user
#   upvote.recipe = recipe
#   upvote.save!
# end

# food array extended: "Tiramisu", "Tacos", "Stinky Tofu", "Chicken Parm",
#           "Meatballs with Sauce", "Fried Eggs", "Sushi", "Cauliflower Penne", "Pasta with Tomato and Basil",
#           "Massaman Curry", "Pizza", "Fish and Chips", "Katsu Curry", "Chocolate Cookies", "Belgian Waffles",
#           "Cinnamon French Roast Casserole", "Meatloaf"
=======
puts "creating upvotes and comments"
10.times do
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
>>>>>>> master
