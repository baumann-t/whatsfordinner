require_relative 'scraper'
require 'open-uri'

User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all
FeedItem.destroy_all

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
image_file = URI.open('https://avatars.githubusercontent.com/u/94934653?v=4')
kieran.photo.attach(io: image_file, filename: "Kieran's Avatar", content_type: 'image/png')
kieran.save!

# ----- CREATE USER START -----
puts "Creating Sebastien"
seb = User.new(
  email: "seb@test.com",
  password: 123456,
  first_name: "Sébastien",
  last_name: "Saunier",
  location: "Paris"
)
puts seb.first_name
image_file = URI.open('https://media-exp1.licdn.com/dms/image/C4D03AQHbDdqG1f9QhA/profile-displayphoto-shrink_800_800/0/1588588745224?e=1652313600&v=beta&t=NOQjBvsCa8r76IVr7DjnwaY0Be-kiGYSyq6sz47Z9M0')
seb.photo.attach(io: image_file, filename: "Seb's Avatar", content_type: 'image/png')
seb.save!

# CREATE FOLLOWED (relationship)
# CREATE FEED ITEM
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
image_file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641495117/tuy0mhevgftsg3fnakpe.jpg')
thomas.photo.attach(io: image_file, filename: "Thomas's Avatar", content_type: 'image/png')
thomas.save!



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
  location: "Montreal",
)
image_file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641790572/gsttrjkzlgxixrj25r5v.jpg')
huang.photo.attach(io: image_file, filename: "Huang's Avatar", content_type: 'image/png')
huang.save!

puts "Creating Lea"
lea = User.new(
  email: "lea@test.com",
  password: 123456,
  first_name: "Lea",
  last_name: "Pontet",
  location: "London"
)
image_file = URI.open('https://avatars.githubusercontent.com/u/49417360?v=4')
lea.photo.attach(io: image_file, filename: "Lea's Avatar", content_type: 'image/png')
lea.save!
puts lea.first_name


# Create relationships
kieran.follow(thomas)
kieran.follow(lea)
kieran.follow(seb)

# ----- CREATE RECIPE START -----
shrimp_pasta = Recipe.new(
  title: "Shrimp Pasta",
  description: "A simple yet delicious pasta with shrimps",
  ingredients: ["400g of linguine", "500g of shrimps",
               "1/3 cup of olive oil", "5 cloves of garlic",
                "1/2 teaspoon of red pepper flakes",
                "1/3 cup of dry white wine", "1/2 lemon juice",
                "4 tablespoons of butter",
                "1/4 chopped parsley"],
  prep_time: "30 min",
  cooking_time: "25 min",
  instructions: ["Bring a large pot of salted water to a boil.", "Add the linguine and cook as the label directs.", "Reserve 1 cup cooking water, then drain.",
                "Season the shrimp with salt, heat the olive oil in a large skillet over medium-high heat.",
                "Add the garlic and red pepper flakes and cook until the garlic is just golden, 30 seconds to 1 minute.",
                "Add the shrimp and cook, stirring occasionally, until pink and just cooked through, 1 to 2 minutes per side.",
                "Remove the shrimp to a plate. Add the wine and lemon juice to the skillet and simmer until slightly reduced, 2 minutes.",
                "Return the shrimp and any juices from the plate to the skillet along with the linguine,
                butter and 1/2 cup of the reserved cooking water.", "Continue to cook, tossing, until the butter
                is melted and the shrimp is hot, about 2 minutes, adding more of the reserved cooking water as needed.", "Season with salt; stir in the parsley.
                Serve with lemon wedges.",],
  categories: ["Italian", "Citrus"],
  serving_size: "4",
  upvotes_tracker: 2
)

# Image of the recipe
image_file = URI.open('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/07/16/0/FNM_090120-Classic-Shrimp-Scampi_s4x3.jpg.rend.hgtvcom.826.620.suffix/1594915956100.jpeg')
shrimp_pasta.photo.attach(io: image_file, filename: shrimp_pasta.title, content_type: 'image/png')

# Target Lea as the author of the recipe
shrimp_pasta.user = User.where(first_name: "Lea").first

# People added this recipe to their cookbook
user_recipe = UserRecipe.new(
  user: lea, recipe: shrimp_pasta
)

# Save it
shrimp_pasta.save!
user_recipe.save!
puts shrimp_pasta.title

# Comments


# ------ Another recipe
baked_salmon = Recipe.new(
  title: "Baked Salmon",
  description: "This simple baked salmon really hits all the right notes: tangy, sweet, savory,
                a little spicy and crunchy. Cooking a larger piece makes for a nice presentation.
                Topped with buttery golden breadcrumbs and parsley,
                it's perfect for a weeknight dinner yet fancy enough to serve to guests.",
  ingredients: ["2 tablespoon of brownsugar", "1/2 teaspoon of paprika", "1/2 teaspoon of garlic powder",
                "1/4 teaspoon of cayenne pepper", "salt", "ground black pepper", "1/4 cup of panko breadcrumbs",
                "1/2 cup of chopped parsley", "2 tablespoon of butter", "700g of salmon fillet", "1 tablespoon of dijon"],
  prep_time: "30 min",
  cooking_time: "1 h",
  instructions: ["Preheat the oven to 425 degrees F.", "Line a baking sheet with foil. Mix the brown sugar, paprika,
                garlic powder, cayenne pepper, 1 teaspoon kosher salt and a generous amount of freshly ground black
                pepper in a small bowl.", "Mix the panko with the parsley, butter, 1/4 teaspoon kosher salt and a few
                grinds of black pepper in another small bowl.", "Then Place the salmon skin-side down on the prepared
                baking sheet and spread the surface with the Dijon.", "Press the brown sugar mixture all over the
                salmon then top with the breadcrumb mixture.", "Crimp all four sides of the foil to create a border
                around the salmon, this will help collect the juices so they don't spread and burn.", "Bake until the
                breadcrumbs are golden brown, and the salmon is firm and flakes easily when pressed, 15 to 18 minutes.",
                "Cut into four equal portions for serving."],
  categories: ["American", "Fish"],
  serving_size: "4",
  upvotes_tracker: 4
)

image_file = URI.open('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/12/20/0/FNK_Baked-Salmon_H_s4x3.jpg.rend.hgtvcom.826.620.suffix/1576855635102.jpeg')
baked_salmon.photo.attach(io: image_file, filename: baked_salmon.title, content_type: 'image/png')
baked_salmon.user = lea
user_recipe = UserRecipe.new(
  user: lea, recipe: baked_salmon
)

baked_salmon.save!
user_recipe.save!
puts baked_salmon.title

# ------ Another recipe
egg_sandwich = Recipe.new(
  title: "Egg Sandwich",
  description: "Simple and super fast egg sandwich.",
  ingredients: ["1 tablespoon of ketchup", "1/2 teaspoon chipotle sauce",
                "2 slices of bread", "2 slices of cheddar",
                "1 tablespoon of butter", "1 slice of bacon", "1 egg"],
  prep_time: "20 min",
  cooking_time: "20 min",
  instructions: ["Combine the ketchup and chipotle and spread on the inside of each piece of bread.",
                 "Place the cheese between the bread at an angle so that the edges hangover the sides of the bread.",
                 "Butter the outside of one bread slice with half the butter. Heat a skillet over medium heat.",
                 "Press the sandwich on, buttered-side down.",
                 "Press until the bread is golden brown and the cheese has started to melt.",
                 "Butter the other side (which is facing up) with the remaining butter and flip.",
                 "Cook until golden brown and the cheese is gooey, this should all take 3 to 4 minutes.",
                 "Remove the sandwich from the heat and hold.",
                 "Meanwhile, in a pan over medium heat, cook the bacon until barely crisp, about 5 minutes.",
                 "Flip the bacon, pushing the two pieces next to each other to form a square.",
                 "Crack the egg on top, cooking into the bacon. Continue cooking until the egg is set, about 5 minutes.",
                 "Open up the sandwich (use a spoon to help pull apart the bread) and slide in the eggs and bacon.",
                 "Close up, slice and enjoy."],
  categories: ["Comfort Food", "Breafast"],
  serving_size: "1"
)

image_file = URI.open('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/11/3/2/NLV-Crave-Worthy_breakfast-sandwich_s4x3.jpg.rend.hgtvcom.826.620.suffix/1478289713133.jpeg')
egg_sandwich.photo.attach(io: image_file, filename: egg_sandwich.title, content_type: 'image/png')

# Target Thomas as the chef
egg_sandwich.user = User.where(first_name: "Thomas").first
egg_sandwich.save!

# People added this recipe to their cookbook
user_recipe = UserRecipe.new(
  user: thomas, recipe: egg_sandwich
)
user_recipe.save!
puts egg_sandwich.title

user_recipe = UserRecipe.new(
  user: kieran, recipe: egg_sandwich, cooked: true, date_cooked:  Date.today.last_week.beginning_of_week
)
user_recipe.save!
puts egg_sandwich.title

# need to associate recipe id with my cookbook and mark as cooked

# comment = Comment.new(content: "This is the worst crap I've ever tasted!")
# comment.user = User.first
# comment.recipe = egg_sandwich
# comment.user_recipe = user_recipe
# comment.save!

# ------ Another recipe
tomato_pasta = Recipe.new(
  title: "Tomato Pasta",
  description: "This dish will always leave you satisfied! Trust me ;)",
  ingredients: ["500g penne", "2 tablespoon of olive oil", "1 small onion", "2 garlic cloves", "salt to taste",
                "ground black pepper to taste", "1 can crushed tomatoes", "1/2 cup of heavy cream", "1/2 cup of basil leaves",
                "grated parmesan to taste"],
  prep_time: "35 min",
  cooking_time: "30 min",
  instructions: ["Heat olive oil in a large, high-sided sauté pan over medium heat until shimmering.",
                "Add the onion and sauté until softened and translucent, 3 to 4 minutes.",
                "Add the garlic and red pepper flakes, if using, and sauté until fragrant, 30 seconds to 1 minute.",
                "Carefully pour in the crushed tomatoes. Add the salt and pepper and stir to combine.",
                "Bring to a simmer and cook, uncovered, stirring occasionally, for 10 minutes.",
                "Reduce heat to low and stir in the cream. Taste and season with additional salt and pepper as needed.",
                "Meanwhile, bring a large pot of salted water to a boil.", "Add the pasta and cook al dente, about
                10 minutes or according to package instructions.", "Drain the pasta and add it to the sauce.", "Toss gently to
                combine.", "Add the basil, toss once more, and serve immediately with grated cheese."],
  categories: ["Italian", "Spicy"],
  serving_size: "4",
  upvotes_tracker: 1
)
image_file = URI.open('https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_center,w_1460,h_1825/k%2Farchive%2F0eb929bc2c007ebf6009316a327b1e37587045a4')
tomato_pasta.photo.attach(io: image_file, filename: tomato_pasta.title, content_type: 'image/png')
tomato_pasta.user = kieran
tomato_pasta.save!
user_recipe = UserRecipe.new(
  user: kieran, recipe: tomato_pasta
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
  ingredients: ["1 ribeye steak", "salt to taste", "ground black pepper to taste",
                "3 tablespoon canola oil", "3 tablespoon of butter", "3 cloves of garlic",
                "2 sprigs fresh thyme"],
  prep_time: "1 h",
  cooking_time: "10 min",
  instructions: ["Preheat oven to 200°F (95°C).", "Generously season all sides of the steak with salt and pepper.
                Transfer to a wire rack on top of a baking sheet, then bake for about 45 minutes to an hour until the
                internal temperature reads about 125°F (51° C) for medium-rare.", "Adjust the bake time based on if you
                like your steak more rare or more well-done.", "Heat the canola oil in a pan over high heat until smoking.
                Do not use olive oil, as its smoke point is significantly lower than that of canola oil and will smoke
                before reaching the desired cooking temperature.", "Sear the steak for 30 seconds on the first side,
                then flip.", "Add the butter, garlic, rosemary, and thyme and swirl around the pan.", "Transfer the garlic
                and herbs on top of the steak and baste the steak with the butter using a large spoon.", "Baste for about
                30 seconds, then flip and baste the other side for about 15 seconds.", "Turn the steak on its side and cook
                to render off any excess fat.", "Rest the steak on a cutting board or wire rack for about 10 minutes.",
                "Slicing the steak before the resting period has finished will result in a lot of the juices leaking out,
                which may not be desirable.", "Slice the steak into ½ -inch (1 cm) strips, then fan out the slices and serve."],
  categories: ["American", "Comfort Food"],
  serving_size: "2",
  upvotes_tracker: 2
)
image_file = URI.open('https://www.eatwell101.com/wp-content/uploads/2020/10/Garlic-Butter-Steak-recipe-roasted-in-Oven.jpg')
garlic_butter_steak.photo.attach(io: image_file, filename: garlic_butter_steak, content_type: 'image/png')
garlic_butter_steak.user = huang
garlic_butter_steak.save!


user_recipe = UserRecipe.new(
  user_id: huang.id, recipe_id: garlic_butter_steak.id
)
user_recipe.save!
p user_recipe.recipe.id
p user_recipe.user.id

pad_thai = Recipe.new(
  title: "Shrimp Pad Thai",
  description: "Easy shrimp pad thai, super popular",
  ingredients: ["1/3 cup of water", "4 teaspoon of tamarind paste", "1/3 cup of palm sugar",
                "2/3 cup Asian fish sauce", "1/4 teaspoon salt", "1 1/2 cup of mung bean sprouts", "2 limes",
                "1/4 cup of peanuts", "1/3 cup of sugar", "1/3 cup of red pepper", "12 ounces dried flat rice noodles",
                "4 garlic cloves", "2 shallots", "12 ounces shrimp", "3 eggs", "2 bunches scallions",
                "5 tablespoons vegetable oil"],
  prep_time: "20 min",
  cooking_time: "20 min",
  instructions: ["In a medium bowl, combine the water, tamarind paste, palm or dark brown sugar, fish sauce, and salt and stir until the sugar is dissolved.",
                "Place the bean sprouts, limes, and peanuts each in their own small bowl and arrange near the stove.
                Place the fish sauce, granulated sugar, and crushed red pepper each in their own small bowl and arrange
                on the dining table.", "Bring a 5-quart saucepan of water to a full, rolling boil. Remove it from the
                heat and immediately add the rice noodles, making sure they are fully submerged in the water. Let the
                noodles soak for exactly 3 minutes (use a timer), occasionally lifting them up and pulling them apart as
                necessary with tongs or a long fork to keep the noodles separate and help them soften evenly. Drain the
                noodles in a large colander and rinse them under cold running water. (If the noodles become sticky and
                clumped together while standing, rinse them briefly under cold water just before cooking, so that they
                return to their slippery, firm, toss-able state.)", "In a small bowl combine the garlic and shallots.
                Place the shrimp, beaten eggs, bean sprouts, scallion greens, and peanuts each in their own bowl and arrange near
                the stove. Have ready 1 clean medium bowl for the cooked shrimp and eggs, and arrange a platter for
                serving near the stove.", "Heat a large wok over high heat until hot but not smoking. Add 2 tablespoons
                of the vegetable oil and swirl to coat the pan. (If at any point during cooking the oil starts smoking,
                lower the heat.) When the oil is hot, scatter in the shrimp. Cook undisturbed until the shrimp begin to
                change color and firm up, about 30 seconds. Toss well then continue to cook, stirring frequently,
                until the shrimp are pink, firm and just cooked through, about 30 seconds longer. Using a slotted spoon,
                transfer the shrimp to the clean bowl.", "Add the eggs and swirl the pan to spread them into a thin layer.
                Cook the eggs, lifting the sides and tilting the pan to allow the uncooked eggs to pour underneath as
                you do when making an omelet, until the eggs are mostly set, 1 to 1 1/2 minutes. Remove the pan from the
                heat and use the slotted spoon to quickly cut the eggs into bite-size pieces then add them to the bowl of shrimp.",
                "Place the wok over high heat and add the remaining 2 tablespoons of vegetable oil, and swirl to coat the pan.
                Add the garlic and shallots and stir-fry until fragrant, about 5 seconds. Scatter in the softened rice
                noodles, and using tongs, evenly spread the noodles out across the pan, like a net. Let them cook
                undisturbed for 15 seconds then scoop them in toward the center. Toss the noodles gently then spread them
                out again. Pour about 1/3 of the seasoning sauce around the edges of the pan, and continue stir-frying the
                noodles in the same manner, spreading them out and letting them cook undisturbed occasionally, until most of
                the sauce is absorbed, about 30 seconds more.", "Add another third of the sauce and continue to stir-fry
                in the same manner until most of the sauce is absorbed and the noodles are just tender but not mushy,
                about 30 seconds. Test a noodle or two: If they are too firm, add 2 to 4 tablespoons of water around the
                edge of the pan, and continue stir-frying until they are just tender and evenly coated with the sauce.",
                "Return the shrimp and eggs to the pan, along with any juices collected in the bottom of the bowl, and
                toss to incorporate them into the noodles. Add the remaining third of the seasoning sauce, along with the bean sprouts,
                scallion greens, and chopped peanuts, and cook, tossing, until they are mixed in and barely heated, about 30 seconds."],
  categories: "Thai",
  serving_size: "4",
  upvotes_tracker: 0
)
image_file = URI.open('https://assets.epicurious.com/photos/54ad371619925f464b3b0a03/master/w_1280,c_limit/51206860_shrimp-pad-thai-four_1x1.jpg')
pad_thai.photo.attach(io: image_file, filename: pad_thai, content_type: 'image/png')
pad_thai.user = thomas
pad_thai.save!

user_recipe = UserRecipe.new(
  user_id: thomas.id, recipe_id: pad_thai.id
)
user_recipe.save!
p user_recipe.recipe.id
p user_recipe.user.id

# puts garlic_butter_steak.title
# need to associate recipe id with my cookbook and mark as cooked


# comment = Comment.new(content: "This is so delicious! I cook it every day")
# comment.user = huang
# comment.recipe = shrimp_pasta
# comment.user_recipe = user_recipe
# comment.save!
# FeedItem.create!(item_type: "added", user_recipe_id: user_recipe.id, user_id: thomas.id)

puts "creating upvotes and comments"
[garlic_butter_steak, shrimp_pasta, egg_sandwich, baked_salmon].each_with_index do |recipe, index|
  user = [seb, thomas, kieran, huang][index]
  # guard clause
  # Check if there's already an upvote from this user to that recipe
  unless recipe.upvotes.pluck(:user_id).include?(user.id)
    # Comment section
    content = ["So nice!", "I'll try that next week!", "Added to my cookbook right away!", "I cook it every week, it is delicious", "You should go to Top Chef!", "You are an amazing cook", "I am learning so much from you"].sample
    comment = Comment.new(content: content)
    comment.user = user
    comment.recipe = recipe
    user_recipe = UserRecipe.where(user_id: recipe.user.id, recipe_id: recipe.id).first
    comment.user_recipe = user_recipe
    comment.save!
    FeedItem.create!(item_type: "commented", user_recipe_id: user_recipe.id, user_id: user.id)


    # # Upvote section
    # upvote = Upvote.new
    # upvote.user = user
    # upvote.recipe = recipe
    # upvote.save!
    # FeedItem.create!(item_type: "liked", user_recipe_id: user_recipe.id, user_id: user.id)
  end
end

comment = Comment.new(content: "This shrimp pasta is delicious, the lemon really bring the flavour together !!!!")
comment.user = User.third
comment.recipe = baked_salmon
comment.user_recipe = user_recipe
comment.save!
FeedItem.create!(item_type: "commented", user_recipe_id: user_recipe.id, user_id: User.third.id)

comment = Comment.new(content: "Amazing, can't wait to try it")
comment.user = User.fourth
comment.recipe = baked_salmon
comment.user_recipe = user_recipe
comment.save!
FeedItem.create!(item_type: "commented", user_recipe_id: user_recipe.id, user_id: User.fourth.id)

comment = Comment.new(content: "This is wonderful")
comment.user = User.fifth
comment.recipe = baked_salmon
comment.user_recipe = user_recipe
comment.save!
FeedItem.create!(item_type: "commented", user_recipe_id: user_recipe.id, user_id: User.fifth.id)


comment = Comment.new(content: "This is so delicious! I cook it every day")
comment.user = huang
comment.recipe = shrimp_pasta
comment.user_recipe = user_recipe
comment.save!
FeedItem.create!(item_type: "added", user_recipe_id: user_recipe.id, user_id: thomas.id)


[thomas, kieran, seb, huang].each do |test|
  Upvote.create(user_id: test.id, recipe_id: 2)
end

Upvote.create(user_id: huang.id, recipe_id: 4)
Upvote.create(user_id: thomas.id, recipe_id: 5)
Upvote.create(user_id: lea.id, recipe_id: 5)
