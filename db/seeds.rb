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

puts "Creating users"

15.times do
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
50.times do
  recipe = Recipe.new(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    ingredients: "#{Faker::Food.ingredient},#{Faker::Food.measurement}, #{Faker::Food.ingredient}, #{Faker::Food.measurement}",
    prep_time: "#{Faker::Number.between(from: 1, to: 10)} hours",
    instructions: "Cook the #{Faker::Food.ingredient} on #{["high", "low", "medium"].sample} for 10 minutes. Add the #{Faker::Food.spice}. Bake for #{Faker::Number.between(from: 1, to: 10)} hours. Then add #{Faker::Food.measurement} of #{Faker::Food.spice}. Prepare the #{Faker::Food.fruits} for dessert",
    category: Faker::Food.ethnic_category,
    serving_size: "#{Faker::Number.between(from: 2, to: 10)} servings"
  )

  @foods = ["Pho", "Cauliflower Penne", "Fettuccine Alfredo", "Mushroom Risotto", "Scotch Eggs", "Caprese Salad", "Chicken Milanese", "Lasagne", "Katsu Curry", "Barbecue Ribs", "Chicken Fajitas", "Arepas", "Chili con Carne", "Tuna Sashimi", "Fish and Chips", "Pork Sausage Roll", "Hummus", "Poutine", "California Maki", "Linguine with Clams", "French Fries with Sausages", "Bruschette with Tomato", "Pork Belly Buns", "French Toas", "Souvlaki", "Pierogi", "Pasta and Beans", "Salmon Nigiri", "Bunny Chow", "Peking Duck", "Pizza", "Kebab", "Cheeseburger", "Ebiten maki", "Tiramisu", "Tacos", "Stinky Tofu", "Chicken Parm", "Meatballs with Sauce", "Fried Eggs", "Sushi", "Cauliflower Penne", "Pasta with Tomato and Basil", "Massaman Curry", "Pizza", "Fish and Chips", "Katsu Curry", "Chocolate Cookies", "Belgian Waffles", "Cinnamon French Roast Casserole", "Meatloaf"]
  image_file = scraping(@foods.sample)
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
  user = User.all.to_a.sample
  recipe = Recipe.all.to_a.sample
  user_recipe = UserRecipe.new(
    cooked: [false, true].sample,
    date_cooked: Faker::Date.in_date_period(year: 2018, month: 2),
    wishlisted: [false, true].sample
  )
  user_recipe.user = user
  user_recipe.recipe = recipe
  user_recipe.save!
end
