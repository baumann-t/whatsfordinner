require_relative 'scraper'

User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all

puts "creating admin account"
user = User.new(
  email: "admin@test.com",
  password: 123456,
  first_name: "Kieran",
  last_name: "Dunch",
  location: Faker::Address.city
)
puts user.email
puts user.password
user.save!

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

recipe = Recipe.new(
  title: "Escargot",
  description: "a lovely dish just like my mom used to make.",
  ingredients: "#{Faker::Food.ingredient} (#{Faker::Food.measurement}), #{Faker::Food.ingredient} (#{Faker::Food.measurement})",
  prep_time: "#{Faker::Number.between(from: 1, to: 10)} hours",
  instructions: "Cook the #{Faker::Food.ingredient} on #{['high', 'low', 'medium'].sample} for 10 minutes. Add the #{Faker::Food.spice}. Bake for #{Faker::Number.between(from: 1, to: 10)} hours. Then add #{Faker::Food.measurement} of #{Faker::Food.spice}. Prepare the #{Faker::Food.fruits} for dessert",
  category: "French",
  serving_size: "#{Faker::Number.between(from: 2, to: 10)} servings",
  upvotes_tracker: 3
)
image_file = scraping("Escargot")
recipe.photo.attach(io: image_file, filename: recipe.title, content_type: 'image/png')
recipe.user = seb
user_recipe = UserRecipe.new(
  user: seb, recipe: recipe
)
recipe.save!
user_recipe.save!
puts recipe.title

# need to make lea who made a nice sandwich that I will upvote and comment

puts "Creating Lea"
user = User.new(
  email: "lea@test.com",
  password: 123456,
  first_name: "Lea",
  last_name: "Pontet",
  location: "London"
)
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
comment = Comment.new(content: "This is the worst crap I've ever tasted!")
comment.user = User.first
comment.recipe = recipe
comment.save!

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

comment = Comment.new(content: "This was actually pretty good!!!!")
comment.user = User.first
comment.recipe = recipe
comment.save!

recipe.save!
user_recipe.save!
puts recipe.title

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
@foods = ["Pho", "Cauliflower Penne", "Fettuccine Alfredo", "Mushroom Risotto", "Scotch Eggs", "Caprese Salad",
          "Chicken Milanese", "Lasagne", "Katsu Curry", "Barbecue Ribs", "Chicken Fajitas", "Arepas", "Chili con Carne",
          "Tuna Sashimi", "Fish and Chips", "Pork Sausage Roll", "Hummus", "Poutine", "California Maki",
          "Linguine with Clams", "French Fries with Sausages", "Bruschette with Tomato", "Pork Belly Buns",
          "French Toast", "Souvlaki", "Pierogi", "Pasta and Beans", "Salmon Nigiri", "Bunny Chow", "Peking Duck",
          "Pizza", "Kebab", "Cheeseburger", "Ebiten maki"]

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

50.times do
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

puts "creating upvotes and comments"
50.times do
  user = User.all.sample
  recipe = Recipe.all.sample
  content = ["So nice!", "I'll try that next week!", "Added to my cookbook right away!", "Are you sure we need that much sugar?", "Can I replace the wine with beef stock?", "You should go to Top Chef!"].sample

  comment = Comment.new(content: content)
  comment.user = user
  comment.recipe = recipe
  comment.save!

  upvote = Upvote.new
  upvote.user = user
  upvote.recipe = recipe
  upvote.save!
end

# food array extended: "Tiramisu", "Tacos", "Stinky Tofu", "Chicken Parm",
#           "Meatballs with Sauce", "Fried Eggs", "Sushi", "Cauliflower Penne", "Pasta with Tomato and Basil",
#           "Massaman Curry", "Pizza", "Fish and Chips", "Katsu Curry", "Chocolate Cookies", "Belgian Waffles",
#           "Cinnamon French Roast Casserole", "Meatloaf"
